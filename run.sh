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
# Method 1: Use Supervisor API (best method for Home Assistant add-ons)
IP_ADDRESS=$(curl -s -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" http://supervisor/network/info | jq -r '.data.interfaces[] | select(.primary == true) | .ipv4.address[] | split("/")[0]' 2>/dev/null | head -1)

# Method 2: Try to get default gateway and use its network
if [ -z "$IP_ADDRESS" ]; then
    GATEWAY=$(ip route | grep default | awk '{print $3}' | head -1)
    if [ -n "$GATEWAY" ]; then
        # Extract the first 3 octets from gateway (e.g., 192.168.200 from 192.168.200.1)
        NETWORK_PREFIX=$(echo "$GATEWAY" | cut -d. -f1-3)
        # Get IP from same network, excluding Docker networks (172.17-31.x.x)
        IP_ADDRESS=$(ip -4 addr show | grep -oP "(?<=inet\s)${NETWORK_PREFIX}\.\d+" | head -1)
    fi
fi

# Method 3: Get first non-Docker, non-loopback IP
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | grep -v '^172\.(1[7-9]|2[0-9]|3[0-1])\.' | grep -E '^192\.|^10\.' | head -1)
fi

# If still nothing, show placeholder
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
