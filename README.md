# Selenium Standalone for Home Assistant

A Home Assistant add-on that provides Selenium Standalone with Chromium as a shared service for other add-ons and integrations.

## About

This add-on runs Selenium Standalone with Chromium in a Docker container, making it available to other Home Assistant add-ons and integrations that need browser automation capabilities. It's optimized for low resource usage, making it suitable for mini PCs and other resource-constrained environments.

## Use Cases

- UK Bin Collection Data add-on integration
- Web scraping integrations
- Browser automation tasks
- Testing web interfaces

## Installation

### Step 1: Add the Repository

1. Navigate to **Settings** → **Add-ons** → **Add-on Store** in your Home Assistant interface
2. Click the **⋮** menu (three dots) in the top right corner
3. Select **Repositories**
4. Add this repository URL: `https://github.com/davida72/selenium-homeassistant`
5. Click **Add**

### Step 2: Install the Add-on

1. Find "Selenium Standalone" in the add-on store
2. Click on it and press **Install**
3. Wait for the installation to complete

### Step 3: Start the Add-on

1. After installation, go to the **Info** tab
2. Click **Start**
3. Enable **Start on boot** if you want it to start automatically
4. Enable **Watchdog** to automatically restart if it crashes

## Usage

After starting the add-on, check the **Log** tab to see your Selenium URL prominently displayed:

```
=====================================================
  SELENIUM URL: http://localhost:4444/
            or: http://YOUR_HOME_ASSISTANT_IP:4444/
=====================================================
```

### For Home Assistant Add-ons
Use: **`http://localhost:4444/`**

This works for UK Bin Collection Data, AppDaemon, and any other Home Assistant add-on.

### For External Scripts
Use your Home Assistant IP address (e.g., `http://YOUR_HOME_ASSISTANT_IP:4444/`)

### Example: UK Bin Collection Data Add-on

When configuring the UK Bin Collection Data add-on:
- **Selenium URL**: `http://localhost:4444/`

### Watch Browser Sessions Live (Optional)

Want to see what Selenium is doing? Open this URL in your web browser to watch the automated browser in real-time:

- **From Home Assistant**: `http://localhost:7900/`
- **From your network**: Use your Home Assistant IP (e.g., `http://YOUR_HOME_ASSISTANT_IP:7900/`)

This is useful for debugging scripts and watching automation run.

**By default, no password is required** - just open the URL and you'll see the browser immediately.

## Configuration

The add-on provides several configurable options to optimize performance for your hardware:

### Use password to view Selenium sessions
**Default: OFF** - No password required to view browser sessions

### max_sessions
**Default: 2** - Maximum concurrent browser sessions (range: 1-10)

**Recommendations:**
- High-end x86: 3-5 sessions
- Standard x86: 2-3 sessions
- Raspberry Pi 4 (4GB+): 2 sessions
- Raspberry Pi 4 (2GB) or Pi 3: 1 session

### session_timeout
**Default: 300 seconds** - Auto-close idle sessions (range: 60-3600s)

### java_max_memory
**Default: 384 MB** - Maximum Java heap size (range: 128-2048 MB)

**Recommendations:**
- High-end x86: 512-768 MB
- Standard hardware: 384 MB (default)
- Raspberry Pi 2GB or older: 256 MB

**To configure:** Go to Configuration tab, adjust values, save, then restart the add-on.

## Resource Optimization

This add-on is optimized for low resource usage and configurable for different hardware:

### Memory Usage
- **Idle**: ~100-200MB (server running, no sessions)
- **Active (1-2 sessions)**: ~300-500MB (typical usage with default settings)
- **Max (multiple sessions)**: Scales with number of sessions and java_max_memory setting

### Disk Space
- **Docker Image**: ~1.2GB (x86), ~1.5-2GB (ARM/Raspberry Pi)
- **Runtime Data**: Minimal (~10-50MB for logs and temporary files)
- **Total**: ~1.3GB (x86) or ~1.7GB (ARM) disk space required

### Default Configuration (Optimized for Broad Compatibility)
- **Max Sessions**: 2 (configurable 1-10)
- **Session Timeout**: 300 seconds / 5 minutes (configurable 60-3600s)
- **Java Max Memory**: 384MB (configurable 128-2048 MB)
- **Log Level**: WARNING (reduced logging overhead)

All settings except log level are configurable via the Configuration tab to optimize for your specific hardware.

## Technical Details

- **Base Image**: selenium/standalone-chromium:latest
- **Port**: 4444 (WebDriver API)
- **Architecture Support**:
  - **amd64** (Intel/AMD x86-64)
  - **aarch64** (Raspberry Pi 4/5, 64-bit ARM)
  - **armv7** (Raspberry Pi 3/2, 32-bit ARM)
- **Startup**: Automatically starts with Home Assistant services

### Raspberry Pi Support

Fully compatible with Raspberry Pi hardware:

**Supported Models:**
- Raspberry Pi 4/5 (recommended)
- Raspberry Pi 3
- Raspberry Pi 2

**System Requirements:**
- **Minimum**: 2GB RAM
- **Recommended**: 4GB+ RAM for optimal performance
- **Disk Space**: ~1.5-2GB for ARM images
- **SD Card**: Class 10 or better

**Performance:**
- Fully functional for typical automation tasks
- Slower than x86 hardware but handles web scraping and automation well
- Pi 4 with 4GB+ RAM performs best
- Consider reducing max sessions to 2 on older models (Pi 2/3)

## Support

If you encounter any issues:

1. Check the add-on logs in the **Log** tab
2. Ensure port 4444 is not being used by another service
3. Verify your system has sufficient resources (at least 512MB free RAM)
4. Open an issue on [GitHub](https://github.com/davida72/selenium-homeassistant/issues)

## Credits

- Based on [Selenium](https://www.selenium.dev/) by the Selenium Project
- Docker images by [SeleniumHQ](https://github.com/SeleniumHQ/docker-selenium)

## License

MIT License - See LICENSE file for details
