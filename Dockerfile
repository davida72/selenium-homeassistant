FROM selenium/standalone-chromium:latest

# Switch to root to install packages and configure
USER root

# Set environment variables for optimization
ENV SE_NODE_MAX_SESSIONS=3 \
    SE_NODE_SESSION_TIMEOUT=300 \
    SE_SCREEN_WIDTH=1920 \
    SE_SCREEN_HEIGHT=1080 \
    SE_SCREEN_DEPTH=24 \
    SE_START_XVFB=true \
    SE_VNC_NO_PASSWORD=1 \
    SE_OPTS="--log-level WARNING" \
    JAVA_OPTS="-Xmx512m -Xms256m"

# Install bashio for Home Assistant add-on compatibility
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Expose Selenium and VNC ports
EXPOSE 4444 5900 7900

# Use our custom run script
CMD ["/run.sh"]
