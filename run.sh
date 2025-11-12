#!/bin/bash
set -e

# Read configuration from Home Assistant
CONFIG_PATH="/data/options.json"

# Read VNC and NoVNC options (default to false if not set)
ENABLE_VNC="false"
ENABLE_NOVNC="false"

if [ -f "$CONFIG_PATH" ]; then
    ENABLE_VNC=$(jq -r '.enable_vnc // false' $CONFIG_PATH)
    ENABLE_NOVNC=$(jq -r '.enable_novnc // false' $CONFIG_PATH)
fi

# Set VNC environment variables based on configuration
export SE_START_VNC="${ENABLE_VNC}"
export SE_START_NO_VNC="${ENABLE_NOVNC}"

echo "============================================"
echo "Starting Selenium Standalone Service"
echo "============================================"
echo "Configuration:"
echo "  Max Sessions: ${SE_NODE_MAX_SESSIONS}"
echo "  Session Timeout: ${SE_NODE_SESSION_TIMEOUT}s"
echo "  Memory Limit: ${JAVA_OPTS}"
echo "  WebDriver Port: 4444"
echo "  VNC Enabled: ${SE_START_VNC}"
echo "  NoVNC Enabled: ${SE_START_NO_VNC}"
if [ "${SE_START_VNC}" = "true" ] || [ "${SE_START_NO_VNC}" = "true" ]; then
    echo "  VNC Password: DISABLED (no password required)"
    [ "${SE_START_VNC}" = "true" ] && echo "  VNC Port: 5900"
    [ "${SE_START_NO_VNC}" = "true" ] && echo "  NoVNC Port: 7900 (http://homeassistant.local:7900)"
fi
echo "============================================"

# Start Selenium Server using the original entry point
exec /opt/bin/entry_point.sh
