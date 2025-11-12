#!/bin/bash
set -e

# Read configuration from Home Assistant
CONFIG_PATH="/data/options.json"

# Read VNC password option (default to false = no password required)
VNC_PASSWORD_REQUIRED="false"

if [ -f "$CONFIG_PATH" ]; then
    VNC_PASSWORD_REQUIRED=$(jq -r '.["Use password to view Selenium sessions"] // false' $CONFIG_PATH)
fi

# Always enable VNC and NoVNC for session viewing
export SE_START_VNC="true"
export SE_START_NO_VNC="true"

# Set password based on configuration
# If VNC_PASSWORD_REQUIRED is false (default), then SE_VNC_NO_PASSWORD=1 (no password)
# If VNC_PASSWORD_REQUIRED is true, then SE_VNC_NO_PASSWORD=0 (password required, default is "secret")
if [ "${VNC_PASSWORD_REQUIRED}" = "true" ]; then
    export SE_VNC_NO_PASSWORD="0"
    VNC_PASSWORD_STATUS="REQUIRED (default password: 'secret')"
else
    export SE_VNC_NO_PASSWORD="1"
    VNC_PASSWORD_STATUS="DISABLED (no password required)"
fi

echo ""
echo "Starting Selenium Standalone..."
echo "Configuration:"
echo "  Max Sessions: ${SE_NODE_MAX_SESSIONS}"
echo "  Session Timeout: ${SE_NODE_SESSION_TIMEOUT}s"
echo "  Java Memory: ${JAVA_OPTS}"
echo "  VNC Password: ${VNC_PASSWORD_STATUS}"
echo ""

# Start Selenium Server in background
/opt/bin/entry_point.sh &
SELENIUM_PID=$!

# Wait for Selenium to start up
sleep 5

# Get the Home Assistant host IP address
IP_ADDRESS=""

# Method 1: Query Supervisor for Home Assistant Core info (gets the actual HA URL)
if [ -n "$SUPERVISOR_TOKEN" ]; then
    # Get Home Assistant info which includes the IP it's running on
    HA_INFO=$(curl -s --max-time 3 -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" http://supervisor/core/info 2>/dev/null)
    # Try to extract IP from various fields
    if [ -n "$HA_INFO" ]; then
        # Try getting from the host field
        IP_ADDRESS=$(echo "$HA_INFO" | jq -r '.data.ip_address // empty' 2>/dev/null)

        # If that didn't work, try getting from network interfaces
        if [ -z "$IP_ADDRESS" ]; then
            NETWORK_INFO=$(curl -s --max-time 3 -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" http://supervisor/network/info 2>/dev/null)
            # Get the primary interface IP
            IP_ADDRESS=$(echo "$NETWORK_INFO" | jq -r '.data.interfaces[] | select(.primary == true) | .ipv4.address[0]' 2>/dev/null | cut -d'/' -f1)
        fi

        # If still nothing, try getting host info
        if [ -z "$IP_ADDRESS" ]; then
            HOST_INFO=$(curl -s --max-time 3 -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" http://supervisor/host/info 2>/dev/null)
            IP_ADDRESS=$(echo "$HOST_INFO" | jq -r '.data.ip_address // empty' 2>/dev/null)
        fi
    fi
fi

# Method 2: Parse /proc/net/route to find default gateway, then find IP on same network
if [ -z "$IP_ADDRESS" ] && [ -f /proc/net/route ]; then
    # Get default gateway from routing table
    GATEWAY_HEX=$(awk '/^[^\t]+\t00000000\t/ {print $3}' /proc/net/route 2>/dev/null | head -1)
    if [ -n "$GATEWAY_HEX" ]; then
        # Convert hex to decimal IP (reverse byte order)
        GATEWAY=$(printf "%d.%d.%d.%d" 0x${GATEWAY_HEX:6:2} 0x${GATEWAY_HEX:4:2} 0x${GATEWAY_HEX:2:2} 0x${GATEWAY_HEX:0:2} 2>/dev/null)
        if [ -n "$GATEWAY" ]; then
            # Get network prefix (first 3 octets)
            NETWORK_PREFIX=$(echo "$GATEWAY" | cut -d. -f1-3)
            # Find IP on same network
            IP_ADDRESS=$(ip addr 2>/dev/null | grep -oP "inet ${NETWORK_PREFIX}\.\d+" | head -1 | awk '{print $2}')
        fi
    fi
fi

# Method 3: Try hostname command and filter out Docker/loopback IPs
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS=$(hostname -I 2>/dev/null | tr ' ' '\n' | grep -v '^127\.' | grep -v '^172\.[1-3][0-9]\.' | grep -v '^169\.254\.' | head -1)
fi

# Final fallback
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS="YOUR_IP_ADDRESS"
fi

echo ""
echo "=============================================="
echo "  SELENIUM URL: http://localhost:4444/"
echo "            or: http://${IP_ADDRESS}:4444/"
echo "=============================================="
echo ""
echo "NoVNC Session Viewer:"
echo "  http://localhost:7900/"
echo "  http://${IP_ADDRESS}:7900/"
echo ""
echo "Selenium Standalone is ready!"
echo ""

# Wait for Selenium process to finish
wait $SELENIUM_PID
