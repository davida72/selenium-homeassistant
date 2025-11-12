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
# Use simple, fast methods only - no hanging!
IP_ADDRESS=""

# Method 1: Simple hostname command, filter out Docker IPs
IP_ADDRESS=$(hostname -I 2>/dev/null | awk '{print $1}')

# Filter out common Docker/loopback ranges
if echo "$IP_ADDRESS" | grep -qE '^(127\.|172\.([1-2][0-9]|3[0-1])\.|169\.254\.)'; then
    IP_ADDRESS=""
fi

# Method 2: If that didn't work, just show placeholder
if [ -z "$IP_ADDRESS" ]; then
    IP_ADDRESS="YOUR_HOME_ASSISTANT_IP"
fi

echo ""
echo "====================================================="
echo "  SELENIUM URL: http://localhost:4444/"
echo "            or: http://${IP_ADDRESS}:4444/"
echo "====================================================="
echo ""
echo "NoVNC Session Viewer:"
echo "  http://localhost:7900/"
echo "  http://${IP_ADDRESS}:7900/"
echo ""
echo "Selenium Standalone is ready!"
echo ""

# Wait for Selenium process to finish
wait $SELENIUM_PID
