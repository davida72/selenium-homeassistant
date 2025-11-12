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

# Method 1: Try Supervisor API (if available)
if [ -n "$SUPERVISOR_TOKEN" ]; then
    IP_ADDRESS=$(curl -s -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" http://supervisor/network/info 2>/dev/null | jq -r '.data.interfaces[] | select(.primary == true) | .ipv4.address[0]' 2>/dev/null | cut -d'/' -f1)
fi

# Method 2: Try hostname command and filter out Docker IPs
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS=$(hostname -I 2>/dev/null | tr ' ' '\n' | grep -v '^127\.' | grep -v '^172\.[1-3][0-9]\.' | head -1)
fi

# Method 3: Parse ip route for default route source IP
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS=$(ip route get 8.8.8.8 2>/dev/null | grep -oP 'src \K[\d.]+' | head -1)
fi

# Method 4: Get default gateway and infer host IP
if [ -z "$IP_ADDRESS" ]; then
    GATEWAY=$(ip route 2>/dev/null | grep default | awk '{print $3}' | head -1)
    if [ -n "$GATEWAY" ]; then
        NETWORK_PREFIX=$(echo "$GATEWAY" | cut -d. -f1-3)
        IP_ADDRESS=$(ip addr 2>/dev/null | grep "inet ${NETWORK_PREFIX}" | head -1 | awk '{print $2}' | cut -d'/' -f1)
    fi
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
