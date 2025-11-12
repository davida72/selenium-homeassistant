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
            or: http://192.168.200.234:4444/
=====================================================
```

### For Home Assistant Add-ons
Use: **`http://localhost:4444/`**

This works for UK Bin Collection Data, AppDaemon, and any other Home Assistant add-on.

### For External Scripts
Use the IP address shown in your logs (e.g., `http://192.168.200.234:4444/`)

### Example: UK Bin Collection Data Add-on

When configuring the UK Bin Collection Data add-on:
- **Selenium URL**: `http://localhost:4444/`

### Watch Browser Sessions Live (Optional)

Want to see what Selenium is doing? Open this URL in your web browser to watch the automated browser in real-time:

- **From Home Assistant**: `http://localhost:7900/`
- **From your network**: Check logs for IP address (e.g., `http://192.168.200.234:7900/`)

This is useful for debugging scripts and watching automation run.

**By default, no password is required** - just open the URL and you'll see the browser immediately.

## Configuration

### Use password to view Selenium sessions

**Default: OFF (no password required)**

If you want to require a password before viewing browser sessions:

- **OFF (Default)**: No password needed - open the viewer instantly
- **ON**: Password required (default password is `secret`)

**To change**: Toggle the setting, save, then restart the add-on (no reinstall needed).

## Resource Optimization

This add-on is optimized for low resource usage:

### Memory Usage
- **Idle**: ~100-200MB (server running, no sessions)
- **Active (1-2 sessions)**: ~300-500MB (typical usage)
- **Max (3 sessions)**: ~400MB-1GB (all sessions active)

### Disk Space
- **Docker Image**: ~1.2GB (includes Chromium browser and Selenium)
- **Runtime Data**: Minimal (~10-50MB for logs and temporary files)
- **Total**: ~1.3GB disk space required

### Configuration
- **Max Sessions**: 3 concurrent sessions
- **Session Timeout**: 300 seconds (5 minutes)
- **Java Memory**: 256MB min, 512MB max
- **Log Level**: WARNING (reduced logging overhead)

## Technical Details

- **Base Image**: selenium/standalone-chromium:latest
- **Port**: 4444 (WebDriver API)
- **Architecture Support**: amd64, aarch64, armv7
- **Startup**: Automatically starts with Home Assistant services

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
