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

## Configuration

This add-on works out of the box with optimized settings, but offers optional configuration for session viewing:

### Optional Settings

- **enable_vnc**: Enable VNC server for viewing browser sessions (default: `false`)
- **enable_novnc**: Enable NoVNC web interface for viewing sessions in your browser (default: `false`)

To enable session viewing:
1. Go to the add-on **Configuration** tab
2. Enable **enable_novnc** for browser-based viewing (recommended)
3. Click **Save** and restart the add-on
4. Access sessions at `http://homeassistant.local:7900/` (no password required)

## Usage

Once the add-on is running, other add-ons and services can connect to Selenium using:

```
http://homeassistant.local:4444/
```

Or from within Home Assistant containers:

```
http://localhost:4444/
```

### Example: UK Bin Collection Data Add-on

When configuring the UK Bin Collection Data add-on, use:
- **Selenium URL**: `http://homeassistant.local:4444/`

## Resource Optimization

This add-on is optimized for low resource usage with the following settings:

- **Max Sessions**: 3 concurrent sessions
- **Session Timeout**: 300 seconds (5 minutes)
- **Java Memory**: 256MB min, 512MB max
- **VNC Disabled**: No VNC server running to save resources
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
