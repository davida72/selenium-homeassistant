# Selenium Standalone Add-on Documentation

## Selenium WebDriver URL

Once the add-on is running, use this URL:

### For Home Assistant Add-ons (UK Bin Collection Data, etc.)
```
http://localhost:4444/
```

### For External Scripts/Tools
```
http://YOUR_IP_ADDRESS:4444/
```
(Check the add-on logs for your actual IP address)

### WebDriver Hub Endpoint
```
http://localhost:4444/wd/hub
```
or
```
http://YOUR_IP_ADDRESS:4444/wd/hub
```

**The exact URLs are shown prominently in the add-on logs when it starts.**

---

## Getting Started

1. Click **Start** to launch the service
2. Wait for the status to change to **Started**
3. Go to the **Log** tab to see your Selenium URLs
4. Copy the URL shown (e.g., `http://192.168.1.100:4444/`)
5. Use this URL in your scripts or other add-ons

### Enable Auto-Start (Recommended)
- **Start on boot**: Add-on starts automatically with Home Assistant
- **Watchdog**: Automatic restart if the add-on crashes

---

## Configuration Options

### VNC Password Required

**Default: OFF (No password required)**

Controls whether a password is required to view browser sessions via NoVNC.

- **OFF (Default)**: No password required - access sessions immediately
- **ON**: Password required (default password is `secret`)

**Important**: Changing this setting requires restarting the add-on to take effect.

### Viewing Browser Sessions

The add-on includes NoVNC for viewing live browser sessions in your web browser:

**NoVNC Web Viewer URL:**
```
http://YOUR_IP_ADDRESS:7900/
http://homeassistant.local:7900/
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
