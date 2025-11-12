# Selenium Standalone Add-on Documentation

![Selenium](data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyBpZD0ic2VsZW5pdW1fbG9nbyIgdmlld0JveD0iMCwwLDEzOS4zOCwzNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBkYXRhLW5hbWU9IlNlbGVuaXVtIExvZ28iPgogPHRpdGxlPlNlbGVuaXVtPC90aXRsZT4KIDxwYXRoIGQ9Im00Ni4yIDI2LjM3YTE4Ljg1IDE4Ljg1IDAgMCAxIC0yLjU3LS4yIDI1IDI1IDAgMCAxIC0yLjc0LS41M3YtMS4zOWEyNS4zMSAyNS4zMSAwIDAgMCAyLjcxLjUzIDE4IDE4IDAgMCAwIDIuNS4yIDUuNTEgNS41MSAwIDAgMCAzLjI5LS44NCAyLjc5IDIuNzkgMCAwIDAgMS4xNC0yLjM5IDIuODUgMi44NSAwIDAgMCAtMS4yNC0yLjQ5IDYgNiAwIDAgMCAtMS4yOS0uNzFxLS43OC0uMjktMS42Ny0uNTVhMTUuOTMgMTUuOTMgMCAwIDEgLTIuMzMtLjg3IDUuOTIgNS45MiAwIDAgMSAtMS41OC0xLjA1IDMuNiAzLjYgMCAwIDEgLS45LTEuMzQgNSA1IDAgMCAxIC0uMjktMS43NCA0LjQ2IDQuNDYgMCAwIDEgLjQxLTEuOTMgNC4zMSA0LjMxIDAgMCAxIDEuMTctMS41IDUuMjYgNS4yNiAwIDAgMSAxLjgyLTEgOCA4IDAgMCAxIDIuMzctLjI5IDIwLjUxIDIwLjUxIDAgMCAxIDQuNDEuNTd2MS40MmEyMCAyMCAwIDAgMCAtMi4yMy0uNDQgMTUuMiAxNS4yIDAgMCAwIC0yLS4xNSA0Ljg2IDQuODYgMCAwIDAgLTMuMDguOSAyLjkgMi45IDAgMCAwIC0xLjIyIDIuNDIgMy4yNSAzLjI1IDAgMCAwIC4yMSAxLjIxIDIuNjEgMi42MSAwIDAgMCAuNyAxIDQuODMgNC44MyAwIDAgMCAxLjI3Ljc5IDE0LjMxIDE0LjMxIDAgMCAwIDIgLjY4cTEuMTEuMzMgMi4wNi43MWE2LjIxIDYuMjEgMCAwIDEgMS42NS45NCA0LjA5IDQuMDkgMCAwIDEgMS4xIDEuMzggNC41NCA0LjU0IDAgMCAxIC40IDIgNC4xNSA0LjE1IDAgMCAxIC0xLjU2IDMuNDggNy4xNiA3LjE2IDAgMCAxIC00LjUxIDEuMTh6IiBmaWxsPSIjMDFhNzFjIi8+CiA8cGF0aCBkPSJtNjAuNjIgMjYuMzJhNS40NiA1LjQ2IDAgMCAxIC00LjI4LTEuNjIgNi45IDYuOSAwIDAgMSAtMS40Ni00LjcgNy44IDcuOCAwIDAgMSAxLjQzLTUgNSA1IDAgMCAxIDQuMTQtMS43NSA0LjI0IDQuMjQgMCAwIDEgMy40NyAxLjQzIDYuNDggNi40OCAwIDAgMSAxLjE4IDQuMTJxMCAuNTQgMCAuOTJhMy4yMiAzLjIyIDAgMCAxIC0uMDkuNjRoLTguNTdhNS4zOSA1LjM5IDAgMCAwIDEuMTcgMy41IDQuMTggNC4xOCAwIDAgMCAzLjE5IDEuMTQgMTAuNTIgMTAuNTIgMCAwIDAgMS44Mi0uMTcgMTEuNzcgMTEuNzcgMCAwIDAgMS45My0uNTJsLjEyIDEuMjdhMTAuNjggMTAuNjggMCAwIDEgLTIgLjU1IDExLjQ3IDExLjQ3IDAgMCAxIC0yLjA1LjE5em0tLjIyLTExLjg5cS0zLjY4IDAtMy45NCA0Ljc0aDcuMTVhNi40OSA2LjQ5IDAgMCAwIC0uNzgtMy42MyAyLjc2IDIuNzYgMCAwIDAgLTIuNDMtMS4xMXoiIGZpbGw9IiMwMWE3MWMiLz4KIDxwYXRoIGQ9Im02OC42NCA3aDEuNTh2MTkuMTFoLTEuNTh6IiBmaWxsPSIjMDFhNzFjIi8+CiA8cGF0aCBkPSJtNzkuNTYgMjYuMzJhNS40NiA1LjQ2IDAgMCAxIC00LjI4LTEuNjIgNi45IDYuOSAwIDAgMSAtMS40NS00LjcgNy44IDcuOCAwIDAgMSAxLjQzLTUgNSA1IDAgMCAxIDQuMTQtMS43NSA0LjI0IDQuMjQgMCAwIDEgMy40NyAxLjQzIDYuNDggNi40OCAwIDAgMSAxLjEzIDQuMTJxMCAuNTQgMCAuOTJhMy4yMiAzLjIyIDAgMCAxIC0uMDkuNjRoLTguNTNhNS40IDUuNCAwIDAgMCAxLjE3IDMuNSA0LjE4IDQuMTggMCAwIDAgMy4yIDEuMTQgMTAuNTIgMTAuNTIgMCAwIDAgMS44Mi0uMTcgMTEuOCAxMS44IDAgMCAwIDEuOTMtLjUybC4xMiAxLjI3YTEwLjY4IDEwLjY4IDAgMCAxIC0yIC41NSAxMS40NyAxMS40NyAwIDAgMSAtMi4wNi4xOXptLS4yMS0xMS44OXEtMy42OCAwLTMuOTQgNC43NGg3LjE1YTYuNDkgNi40OSAwIDAgMCAtLjc4LTMuNjMgMi43NiAyLjc2IDAgMCAwIC0yLjQzLTEuMTF6IiBmaWxsPSIjMDFhNzFjIi8+CiA8cGF0aCBkPSJtODcuNTEgMTMuMzdoMS4zMmwuMTIgMS40OWguMTJxLjk0LS40NSAxLjcyLS43OHQxLjQzLS41NGE4LjQyIDguNDIgMCAwIDEgMS4yLS4zMSA2LjU0IDYuNTQgMCAwIDEgMS4xLS4wOSAzLjMgMy4zIDAgMCAxIDIuNDguODYgMy42MyAzLjYzIDAgMCAxIC44MyAyLjYzdjkuNTFoLTEuNTl2LTlhMyAzIDAgMCAwIC0uNTUtMiAyLjE4IDIuMTggMCAwIDAgLTEuNjktLjYgNy4yNSA3LjI1IDAgMCAwIC0yLjI0LjQxIDIwLjEgMjAuMSAwIDAgMCAtMi42NyAxLjEydjEwaC0xLjU4eiIgZmlsbD0iIzAxYTcxYyIvPgogPHBhdGggZD0ibTEwMi43NSAxMC41MmEuOTMuOTMgMCAwIDEgLTEuMDYtMSAxLjA2IDEuMDYgMCAwIDEgMi4xMiAwIC45My45MyAwIDAgMSAtMS4wNiAxem0tLjggMi44NWgxLjU4djEyLjc0aC0xLjU4eiIgZmlsbD0iIzAxYTcxYyIvPgogPHBhdGggZD0ibTExMC44MSAyNi4zNHEtMy4xNCAwLTMuMTQtMy40N3YtOS41aDEuNTh2OWEzLjE2IDMuMTYgMCAwIDAgLjQ4IDIgMS45MiAxLjkyIDAgMCAwIDEuNTkuNiA2LjgzIDYuODMgMCAwIDAgMi40OC0uNDhxMS4yNS0uNDggMi41OS0xLjE0di05Ljk4aDEuNjF2MTIuNzRoLTEuMzJsLS4xMi0xLjU4aC0uMDlsLTEuNzMuODFxLS43NC4zNC0xLjM4LjU3YTcuOSA3LjkgMCAwIDEgLTEuMjMuMzMgNy4zNCA3LjM0IDAgMCAxIC0xLjMyLjF6IiBmaWxsPSIjMDFhNzFjIi8+CiA8cGF0aCBkPSJtMTIyLjE4IDEzLjM3aDEuM2wuMTQgMS40OWguMDlhMTkuNTMgMTkuNTMgMCAwIDEgMi41OC0xLjMxIDUuNTEgNS41MSAwIDAgMSAyLS40MSAyLjgzIDIuODMgMCAwIDEgMyAxLjc3aC4xMnEuOC0uNSAxLjQ1LS44M2ExMi42MSAxMi42MSAwIDAgMSAxLjItLjU0IDYuMTcgNi4xNyAwIDAgMSAxLS4zMSA1LjE4IDUuMTggMCAwIDEgMS0uMDkgMy4zIDMuMyAwIDAgMSAyLjQ1Ljg0IDMuNjMgMy42MyAwIDAgMSAuODMgMi42M3Y5LjUxaC0xLjU2di05YTIuOSAyLjkgMCAwIDAgLS41NS0yIDIuMjEgMi4yMSAwIDAgMCAtMS42OS0uNTkgNS4xNCA1LjE0IDAgMCAwIC0xLjc4LjM4IDE0LjQ1IDE0LjQ1IDAgMCAwIC0yLjE2IDEuMDl2MTAuMWgtMS42di05YTIuOSAyLjkgMCAwIDAgLS41NS0yIDIuMjEgMi4yMSAwIDAgMCAtMS42OS0uNTkgNS4yNCA1LjI0IDAgMCAwIC0xLjg2LjQgMTQgMTQgMCAwIDAgLTIuMTQgMS4wOXYxMC4xMWgtMS41OHoiIGZpbGw9IiMwMWE3MWMiLz4KIDxwYXRoIGQ9Im0yMS40NSAyMS41MWEyLjQ5IDIuNDkgMCAwIDAgLTIuNTUgMi4yMS4wOC4wOCAwIDAgMCAuMDguMWg0Ljk1YS4wOC4wOCAwIDAgMCAuMDgtLjA5IDIuNDEgMi40MSAwIDAgMCAtMi41Ni0yLjIyeiIgZmlsbD0iIzAxYTcxYyIvPgogPHBhdGggZD0ibTMyLjA2IDQuOTEtMTAuNSAxMS43OWEuMzIuMzIgMCAwIDEgLS40NyAwbC01LjM2LTUuNTNhLjMyLjMyIDAgMCAxIDAtLjRsMS43Ny0yLjI3YS4zMi4zMiAwIDAgMSAuNTIgMGwzIDMuMzJhLjMyLjMyIDAgMCAwIC40OSAwbDguMzYtMTEuNDZhLjIzLjIzIDAgMCAwIC0uMTgtLjM2aC0yOS40NGEuMjUuMjUgMCAwIDAgLS4yNS4yNXYzMy41YS4yNS4yNSAwIDAgMCAuMjUuMjVoMzJhLjI1LjI1IDAgMCAwIC4yNS0uMjV2LTI4LjY5YS4yMy4yMyAwIDAgMCAtLjQ0LS4xNXptLTIzIDI1LjM2YTguMDggOC4wOCAwIDAgMSAtNS43NC0yIC4zMS4zMSAwIDAgMSAwLS40MWwxLjI1LTEuNzVhLjMxLjMxIDAgMCAxIC40My0uMTEgNi4xNSA2LjE1IDAgMCAwIDQuMiAxLjY0YzEuNjQgMCAyLjQ0LS43NiAyLjQ0LTEuNTYgMC0yLjQ4LTguMDgtLjc4LTguMDgtNi4wNiAwLTIuMzMgMi00LjI3IDUuMzItNC4yN2E3Ljg4IDcuODggMCAwIDEgNS4yNSAxLjc2LjMxLjMxIDAgMCAxIDAgLjQzbC0xLjIzIDEuNzFhLjMxLjMxIDAgMCAxIC0uNDUuMDUgNi4wOCA2LjA4IDAgMCAwIC0zLjg0LTEuMzJjLTEuMjggMC0yIC41Ny0yIDEuNDEgMCAyLjIzIDguMDYuNzQgOC4wNiA2IDAgMi41NC0xLjgzIDQuNDgtNS42MiA0LjQ4em0xNy42Mi00Ljg3YS4yNy4yNyAwIDAgMSAtLjI4LjI4aC03LjRhLjA5LjA5IDAgMCAwIC0uMDguMSAyLjgxIDIuODEgMCAwIDAgMyAyLjMyIDQuNjIgNC42MiAwIDAgMCAyLjU2LS44NC4yNy4yNyAwIDAgMSAuNC4wNmwuOSAxLjMxYS4yOC4yOCAwIDAgMSAtLjA2LjM3IDYuNjcgNi42NyAwIDAgMSAtNC4xIDEuMjggNS4yOCA1LjI4IDAgMCAxIC01LjU3LTUuNDggNS4zMSA1LjMxIDAgMCAxIDUuNC01LjQ2YzMuMTEgMCA1LjIyIDIuMzMgNS4yMiA1Ljc0eiIgZmlsbD0iIzAxYTcxYyIvPgo8L3N2Zz4K)

## What is Selenium?

**Selenium** is an open-source browser automation framework that allows you to programmatically control web browsers. It's the industry standard for automated web testing and scraping, used by developers and testers worldwide.

### What Does It Do?

- **Browser Control**: Opens web pages, clicks buttons, fills forms, navigates sites
- **Web Scraping**: Extracts data from websites that require JavaScript rendering
- **Testing**: Automates testing of web applications across different scenarios
- **Automation**: Handles repetitive web tasks like data collection or monitoring

### How It Works

Selenium uses the **WebDriver API** to send commands to real web browsers. This add-on runs a Selenium server that receives commands over HTTP and executes them in a Chromium browser. Any application that can make HTTP requests can control the browser.

### Platform Compatibility

**Client Platforms (What Can Use This Service):**
- **Windows**: Python, Node.js, Java, C#, Ruby scripts
- **macOS**: Any programming language with Selenium bindings
- **Linux**: Desktop and server environments
- **Android**: Termux or similar environments with Python/Node.js
- **Web Applications**: Any service that can make HTTP requests
- **Home Assistant Add-ons**: Other add-ons like UK Bin Collection Data

The Selenium server runs in a Docker container on your Home Assistant host, but clients can connect from any platform on your network that supports HTTP connections.

---

## Selenium WebDriver URL

Once the add-on is running, use this URL:

### For Home Assistant Add-ons (UK Bin Collection Data, etc.)
```
http://localhost:4444/
```

### For External Scripts/Tools
```
http://YOUR_HOME_ASSISTANT_IP:4444/
```
(Replace YOUR_HOME_ASSISTANT_IP with your actual Home Assistant IP address)

### WebDriver Hub Endpoint
```
http://localhost:4444/wd/hub
```
or
```
http://YOUR_HOME_ASSISTANT_IP:4444/wd/hub
```

**The exact URLs are shown prominently in the add-on logs when it starts.**

---

## Getting Started

1. Click **Start** to launch the service
2. Wait for the status to change to **Started**
3. Go to the **Log** tab to see your Selenium URLs
4. Copy the URL shown (e.g., `http://YOUR_HOME_ASSISTANT_IP:4444/`)
5. Use this URL in your scripts or other add-ons

### Enable Auto-Start (Recommended)
- **Start on boot**: Add-on starts automatically with Home Assistant
- **Watchdog**: Automatic restart if the add-on crashes

---

## Configuration Options

### Use password to view Selenium sessions

**Default: OFF (No password required)**

Controls whether a password is required to view browser sessions via NoVNC.

- **OFF (Default)**: No password required - access sessions immediately
- **ON**: Password required (default password is `secret`)

### max_sessions

**Default: 2**

Maximum number of concurrent browser sessions. More sessions use more memory and CPU.

**Range**: 1-10

**Recommendations by hardware:**
- **High-end x86 (8GB+ RAM)**: 3-5 sessions
- **Standard x86 (4GB RAM)**: 2-3 sessions
- **Raspberry Pi 4/5 (4GB+)**: 2 sessions (default)
- **Raspberry Pi 4 (2GB)**: 1 session

### session_timeout

**Default: 300 seconds (5 minutes)**

How long idle sessions stay open before being automatically closed. This prevents memory leaks from abandoned sessions.

**Range**: 60-3600 seconds (1 minute to 1 hour)

**Recommendations:**
- **Short-running scripts**: 300s (default) - good balance
- **Long-running automation**: 600-1800s (10-30 minutes)
- **Development/debugging**: 1800-3600s (30-60 minutes)

### java_max_memory

**Default: 384 MB**

Maximum Java heap size for the Selenium server. Lower values reduce memory usage but may impact performance with multiple sessions.

**Range**: 128-2048 MB

**Recommendations by hardware:**
- **High-end x86 (8GB+ RAM)**: 512-768 MB
- **Standard x86 (4GB RAM)**: 384-512 MB (default)
- **Raspberry Pi 4/5 (4GB+)**: 384 MB (default)
- **Raspberry Pi 4 (2GB)**: 256 MB

### Applying Configuration Changes

**To change settings:**
1. Go to the Configuration tab
2. Adjust the values
3. Click **Save**
4. Go to the Info tab and click **Restart**
5. Wait for the add-on to restart (10-15 seconds)

**No reinstall required** - just restart the add-on for new settings to take effect.

### Viewing Browser Sessions

The add-on includes NoVNC for viewing live browser sessions in your web browser:

**NoVNC Web Viewer URL:**
```
http://localhost:7900/
http://YOUR_HOME_ASSISTANT_IP:7900/
```

**Use Cases:**
- Debug scripts that aren't working
- Watch automation run in real-time
- Verify element interactions
- Troubleshoot login flows

**Access**: Open the NoVNC URL in your browser while a Selenium session is active.

## Common Use Cases

### UK Bin Collection Data Add-on

Configure the UK Bin Collection Data add-on to use this Selenium service:

1. Install and start this Selenium Standalone add-on
2. In UK Bin Collection Data configuration, set:
   - Selenium URL: `http://localhost:4444/`
3. Save and restart the UK Bin Collection Data add-on

### Python Selenium Scripts

**From within Home Assistant (AppDaemon, Python Scripts, etc.):**
```python
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

driver = webdriver.Remote(
    command_executor='http://localhost:4444/wd/hub',
    desired_capabilities=DesiredCapabilities.CHROME
)

driver.get('https://example.com')
print(driver.title)
driver.quit()
```

**From external network:**
```python
driver = webdriver.Remote(
    command_executor='http://YOUR_HOME_ASSISTANT_IP:4444/wd/hub',
    desired_capabilities=DesiredCapabilities.CHROME
)

driver.get('https://example.com')
print(driver.title)
driver.quit()
```

### Node.js Scripts

```javascript
const { Builder } = require('selenium-webdriver');

const driver = await new Builder()
    .usingServer('http://homeassistant.local:4444/wd/hub')
    .forBrowser('chrome')
    .build();

await driver.get('https://example.com');
console.log(await driver.getTitle());
await driver.quit();
```

## Resource Optimization & Footprint

### Why Chromium Instead of Chrome?

This add-on uses **Chromium** rather than Google Chrome for several key advantages:

- **Lighter Weight**: Open-source base without proprietary codecs and Google services
- **Smaller Download**: Reduced image size saves disk space and installation time
- **Server-Optimized**: Better suited for headless/server environments
- **No Telemetry**: No tracking or data collection to Google
- **Resource Efficient**: Lower memory overhead without extra features

### Expected Memory Usage

- **Selenium Server (base)**: ~100-200MB when idle with no sessions
- **Each Browser Session**: ~100-300MB (varies based on website complexity)
- **Total with 3 sessions**: ~400MB-1GB maximum with all sessions active

**Typical real-world usage**: 300-500MB with 1-2 active sessions

### Default Resource Settings

The add-on defaults are optimized for broad hardware compatibility:

- **Max Sessions**: 2 concurrent browser sessions (configurable 1-10)
- **Session Timeout**: 300 seconds - closes idle sessions after 5 minutes (configurable 60-3600s)
- **Java Max Memory**: 384MB - caps Java heap size (configurable 128-2048 MB)
- **Log Level**: WARNING - reduces log overhead

All resource settings are configurable via the Configuration tab to optimize for your specific hardware.

### Automatic Updates

**Important**: Each time you **reinstall** or **rebuild** the add-on, it pulls the latest `selenium/standalone-chromium:latest` Docker image. This means you automatically get:

- Latest Chromium browser version
- Latest Selenium WebDriver
- Latest security patches

**Note**: Simply restarting the add-on uses the existing Docker image. To get updates, you need to rebuild (uninstall and reinstall) the add-on.

### Raspberry Pi Support

This add-on supports Raspberry Pi models that run Home Assistant:

```
┌─────────────┬──────────────┬────────┬────────────────┬─────────────────────────────────────┐
│ Model       │ Architecture │ RAM    │ Status         │ Recommended Settings                │
├─────────────┼──────────────┼────────┼────────────────┼─────────────────────────────────────┤
│ Pi 5 (4GB+) │ aarch64      │ 4GB+   │ ✅ Excellent   │ 2 sessions, 384MB Java              │
│ Pi 4 (4GB+) │ aarch64      │ 4GB+   │ ✅ Excellent   │ 2 sessions, 384MB Java (default)    │
│ Pi 4 (2GB)  │ aarch64      │ 2GB    │ ✅ Good        │ 1 session, 256MB Java               │
└─────────────┴──────────────┴────────┴────────────────┴─────────────────────────────────────┘
```

**System Requirements:**
- **Minimum**: Raspberry Pi 4 with 2GB RAM
- **Recommended**: Raspberry Pi 4/5 with 4GB+ RAM for best performance
- **Disk Space**: ~1.5-2GB for ARM images
- **SD Card**: Class 10 or better (A2-rated recommended)

**Performance Considerations:**
- Browser automation will be slower than x86 hardware but fully functional
- Pi 4/5 with 4GB+ RAM handles default settings perfectly
- Pi 4 with 2GB RAM: reduce to 1 session and 256MB Java memory
- Selenium on Raspberry Pi is ideal for periodic automation (UK Bin Collection, etc.)

## Troubleshooting

### Add-on won't start

**Check the logs** for error messages:
- Insufficient memory (need at least 512MB free)
- Port 4444 already in use
- Architecture not supported

**Solution**: Restart Home Assistant or check system resources

### Connection refused errors

**Symptoms**: Other add-ons can't connect to Selenium

**Solution**:
1. Verify the add-on is running (green status)
2. Check logs for any errors
3. Use `http://homeassistant.local:4444/` not `http://localhost:4444/` from other add-ons
4. Restart the add-on

### High memory usage

**Symptoms**: System becoming slow or unresponsive

**Solution**:
1. Sessions may not be closing properly
2. Restart the add-on to clear all sessions
3. Ensure your scripts call `driver.quit()` to close sessions
4. Consider reducing concurrent operations

### Sessions timing out

**Symptoms**: Browser sessions close unexpectedly

**Note**: Sessions automatically close after 5 minutes of inactivity. This is intentional to prevent resource leaks.

If you need longer sessions, this is a trade-off for resource optimization.

## Logs

To view logs:
1. Navigate to the add-on page
2. Click the **Log** tab
3. Look for:
   - "Starting Selenium Standalone Service" - startup confirmation
   - WebDriver session information
   - Any error messages

## Port Information

- **Port 4444** (TCP): Selenium WebDriver API
- **Port 5900** (TCP): VNC Server (for session viewing)
- **Port 7900** (TCP): Web-based session viewer

## Support

For issues, questions, or feature requests:
- Check the [GitHub Issues](https://github.com/davida72/selenium-homeassistant/issues)
- Review the [Selenium Documentation](https://www.selenium.dev/documentation/)
- Visit the [Home Assistant Community Forum](https://community.home-assistant.io/)

## Version Information

Check the **Info** tab for the current version and update notifications.
