#!/bin/bash
set -e

# Read configuration from Home Assistant
CONFIG_PATH="/data/options.json"

# Read VNC password option (default to false = no password required)
VNC_PASSWORD_REQUIRED="false"

if [ -f "$CONFIG_PATH" ]; then
    VNC_PASSWORD_REQUIRED=$(jq -r '.vnc_password_required // false' $CONFIG_PATH)
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

# Get the IP address for display
IP_ADDRESS=$(hostname -I | awk '{print $1}')

echo "============================================"
echo "Selenium Standalone Service Starting"
echo "============================================"
echo ""
echo "SELENIUM WEBDRIVER URL:"
echo "  http://${IP_ADDRESS}:4444/"
echo "  http://homeassistant.local:4444/"
echo ""
echo "SESSION VIEWING (NoVNC):"
echo "  http://${IP_ADDRESS}:7900/"
echo "  http://homeassistant.local:7900/"
echo "  VNC Password: ${VNC_PASSWORD_STATUS}"
echo ""
echo "Configuration:"
echo "  Max Sessions: ${SE_NODE_MAX_SESSIONS}"
echo "  Session Timeout: ${SE_NODE_SESSION_TIMEOUT}s"
echo "  Java Memory: ${JAVA_OPTS}"
echo ""
echo "============================================"

# Start Selenium Server using the original entry point
exec /opt/bin/entry_point.sh
