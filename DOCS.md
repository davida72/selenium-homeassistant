# Selenium Standalone Add-on Documentation

## Overview

This add-on provides Selenium Standalone with Chromium as a shared service for Home Assistant. It's designed to be lightweight and optimized for systems with limited resources.

## Starting the Add-on

1. Click **Start** to launch the service
2. Wait for the status to change to **Started**
3. Check the logs to confirm Selenium is running
4. Enable **Start on boot** for automatic startup
5. Enable **Watchdog** for automatic recovery

## Connecting to Selenium

Once running, Selenium is accessible at:

**From other Home Assistant add-ons:**
```
http://homeassistant.local:4444/
```

**From within Docker containers:**
```
http://localhost:4444/
```

**WebDriver endpoint:**
```
http://homeassistant.local:4444/wd/hub
```

## Configuration

### Viewing Browser Sessions (Optional)

By default, the add-on runs in headless mode without session viewing. You can enable live viewing of browser sessions for debugging:

1. Go to the **Configuration** tab
2. Enable one or both viewing options:
   - **enable_novnc**: Web-based viewer (recommended) - `http://homeassistant.local:7900/`
   - **enable_vnc**: VNC server on port 5900 (requires VNC client)
3. Click **Save**
4. Restart the add-on

**No password required** - Sessions are accessible without authentication for easy debugging.

### When to Enable Session Viewing

- Debugging scripts that aren't working as expected
- Watching automation in real-time
- Verifying element interactions
- Troubleshooting login flows

**Note**: Enabling viewing increases resource usage. Disable when not needed.

## Common Use Cases

### UK Bin Collection Data Add-on

Configure the UK Bin Collection Data add-on to use this Selenium service:

1. Install and start this Selenium Standalone add-on
2. In UK Bin Collection Data configuration, set:
   - Selenium URL: `http://homeassistant.local:4444/`
3. Save and restart the UK Bin Collection Data add-on

### Python Selenium Scripts

```python
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

driver = webdriver.Remote(
    command_executor='http://homeassistant.local:4444/wd/hub',
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

## Resource Optimization

The add-on is pre-configured with these optimizations:

| Setting | Value | Purpose |
|---------|-------|---------|
| Max Sessions | 3 | Limits concurrent browser sessions |
| Session Timeout | 300s | Closes idle sessions after 5 minutes |
| Java Memory | 256-512MB | Limits memory consumption |
| VNC Server | Disabled | Saves CPU and memory |
| Log Level | WARNING | Reduces log overhead |

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

| Port | Protocol | Purpose |
|------|----------|---------|
| 4444 | TCP | Selenium WebDriver API |

## Support

For issues, questions, or feature requests:
- Check the [GitHub Issues](https://github.com/davida72/selenium-homeassistant/issues)
- Review the [Selenium Documentation](https://www.selenium.dev/documentation/)
- Visit the [Home Assistant Community Forum](https://community.home-assistant.io/)

## Version Information

Check the **Info** tab for the current version and update notifications.
