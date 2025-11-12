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
# Try multiple methods to get the real IP

# Method 1: Try hostname command
IP_ADDRESS=$(hostname -I 2>/dev/null | awk '{print $1}' | grep -E '^192\.|^10\.|^172\.(1[6-9]|2[0-9]|3[0-1])\.')

# Method 2: Try ip route
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS=$(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K[^ ]+' | grep -E '^192\.|^10\.|^172\.(1[6-9]|2[0-9]|3[0-1])\.')
fi

# Method 3: Try default gateway route
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS=$(ip -4 addr show 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | grep -E '^192\.|^10\.|^172\.(1[6-9]|2[0-9]|3[0-1])\.' | head -1)
fi

# Final fallback - get first non-loopback IP
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS=$(hostname -I 2>/dev/null | awk '{print $1}')
fi

# If still nothing, show placeholder
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS="YOUR_IP_ADDRESS"
fi

echo ""
echo "=========================================================="
echo "  SELENIUM URL: http://localhost:4444/"
echo "            or: http://${IP_ADDRESS}:4444/"
echo "=========================================================="
echo ""
echo "NoVNC Session Viewer:"
echo "  http://localhost:7900/"
echo "  http://${IP_ADDRESS}:7900/"
echo ""
echo "Selenium Standalone is ready!"
echo ""

# Wait for Selenium process to finish
wait $SELENIUM_PID
