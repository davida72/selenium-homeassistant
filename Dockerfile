FROM selenium/standalone-chromium:latest

# Switch to root to install packages and configure
USER root

# Set environment variables for optimization
# Note: SE_NODE_MAX_SESSIONS, SE_NODE_SESSION_TIMEOUT, and JAVA_OPTS are set dynamically in run.sh
ENV SE_SCREEN_WIDTH=1920 \
    SE_SCREEN_HEIGHT=1080 \
    SE_SCREEN_DEPTH=24 \
    SE_START_XVFB=true \
    SE_VNC_NO_PASSWORD=1 \
    SE_OPTS="--log-level WARNING"

# Install required packages for Home Assistant add-on compatibility
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Expose Selenium and VNC ports
EXPOSE 4444 5900 7900

# Use our custom run script
CMD ["/run.sh"]
