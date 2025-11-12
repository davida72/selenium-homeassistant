# Selenium Standalone Add-on Documentation

![Selenium](data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyBpZD0ic2VsZW5pdW1fbG9nbyIgdmlld0JveD0iMCwwLDEzOS4zOCwzNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBkYXRhLW5hbWU9IlNlbGVuaXVtIExvZ28iPgogPHRpdGxlPlNlbGVuaXVtPC90aXRsZT4KIDxwYXRoIGQ9Im00Ni4yIDI2LjM3YTE4Ljg1IDE4Ljg1IDAgMCAxIC0yLjU3LS4yIDI1IDI1IDAgMCAxIC0yLjc0LS41M3YtMS4zOWEyNS4zMSAyNS4zMSAwIDAgMCAyLjcxLjUzIDE4IDE4IDAgMCAwIDIuNS4yIDUuNTEgNS41MSAwIDAgMCAzLjI5LS44NCAyLjc5IDIuNzkgMCAwIDAgMS4xNC0yLjM5IDIuODUgMi44NSAwIDAgMCAtMS4yNC0yLjQ5IDYgNiAwIDAgMCAtMS4yOS0uNzFxLS43OC0uMjktMS42Ny0uNTVhMTUuOTMgMTUuOTMgMCAwIDEgLTIuMzMtLjg3IDUuOTIgNS45MiAwIDAgMSAtMS41OC0xLjA1IDMuNiAzLjYgMCAwIDEgLS45LTEuMzQgNSA1IDAgMCAxIC0uMjktMS43NCA0LjQ2IDQuNDYgMCAwIDEgLjQxLTEuOTMgNC4zMSA0LjMxIDAgMCAxIDEuMTctMS41IDUuMjYgNS4yNiAwIDAgMSAxLjgyLTEgOCA4IDAgMCAxIDIuMzctLjI5IDIwLjUxIDIwLjUxIDAgMCAxIDQuNDEuNTd2MS40MmEyMCAyMCAwIDAgMCAtMi4yMy0uNDQgMTUuMiAxNS4yIDAgMCAwIC0yLS4xNSA0Ljg2IDQuODYgMCAwIDAgLTMuMDguOSAyLjkgMi45IDAgMCAwIC0xLjIyIDIuNDIgMy4yNSAzLjI1IDAgMCAwIC4yMSAxLjIxIDIuNjEgMi42MSAwIDAgMCAuNyAxIDQuODMgNC44MyAwIDAgMCAxLjI3Ljc5IDE0LjMxIDE0LjMxIDAgMCAwIDIgLjY4cTEuMTEuMzMgMi4wNi43MWE2LjIxIDYuMjEgMCAwIDEgMS42NS45NCA0LjA5IDQuMDkgMCAwIDEgMS4xIDEuMzggNC41NCA0LjU0IDAgMCAxIC40IDIgNC4xNSA0LjE1IDAgMCAxIC0xLjU2IDMuNDggNy4xNiA3LjE2IDAgMCAxIC00LjUxIDEuMTh6IiBmaWxsPSIjMDFhNzFjIi8+CiA8cGF0aCBkPSJtNjAuNjIgMjYuMzJhNS40NiA1LjQ2IDAgMCAxIC00LjI4LTEuNjIgNi45IDYuOSAwIDAgMSAtMS40Ni00LjcgNy44IDcuOCAwIDAgMSAxLjQzLTUgNSA1IDAgMCAxIDQuMTQtMS43NSA0LjI0IDQuMjQgMCAwIDEgMy40NyAxLjQzIDYuNDggNi40OCAwIDAgMSAxLjE4IDQuMTJxMCAuNTQgMCAuOTJhMy4yMiAzLjIyIDAgMCAxIC0uMDkuNjRoLTguNTdhNS4zOSA1LjM5IDAgMCAwIDEuMTcgMy41IDQuMTggNC4xOCAwIDAgMCAzLjE5IDEuMTQgMTAuNTIgMTAuNTIgMCAwIDAgMS44Mi0uMTcgMTEuNzcgMTEuNzcgMCAwIDAgMS45My0uNTJsLjEyIDEuMjdhMTAuNjggMTAuNjggMCAwIDEgLTIgLjU1IDExLjQ3IDExLjQ3IDAgMCAxIC0yLjA1LjE5em0tLjIyLTExLjg5cS0zLjY4IDAtMy45NCA0Ljc0aDcuMTVhNi40OSA2LjQ5IDAgMCAwIC0uNzgtMy42MyAyLjc2IDIuNzYgMCAwIDAgLTIuNDMtMS4xMXoiIGZpbGw9IiMwMWE3MWMiLz4KIDxwYXRoIGQ9Im02OC42NCA3aDEuNTh2MTkuMTFoLTEuNTh6IiBmaWxsPSIjMDFhNzFjIi8+CiA8cGF0aCBkPSJtNzkuNTYgMjYuMzJhNS40NiA1LjQ2IDAgMCAxIC00LjI4LTEuNjIgNi45IDYuOSAwIDAgMSAtMS40NS00LjcgNy44IDcuOCAwIDAgMSAxLjQzLTUgNSA1IDAgMCAxIDQuMTQtMS43NSA0LjI0IDQuMjQgMCAwIDEgMy40NyAxLjQzIDYuNDggNi40OCAwIDAgMSAxLjEzIDQuMTJxMCAuNTQgMCAuOTJhMy4yMiAzLjIyIDAgMCAxIC0uMDkuNjRoLTguNTNhNS40IDUuNCAwIDAgMCAxLjE3IDMuNSA0LjE4IDQuMTggMCAwIDAgMy4yIDEuMTQgMTAuNTIgMTAuNTIgMCAwIDAgMS44Mi0uMTcgMTEuOCAxMS44IDAgMCAwIDEuOTMtLjUybC4xMiAxLjI3YTEwLjY4IDEwLjY4IDAgMCAxIC0yIC41NSAxMS40NyAxMS40NyAwIDAgMSAtMi4wNi4xOXptLS4yMS0xMS44OXEtMy42OCAwLTMuOTQgNC43NGg3LjE1YTYuNDkgNi40OSAwIDAgMCAtLjc4LTMuNjMgMi43NiAyLjc2IDAgMCAwIC0yLjQzLTEuMTF6IiBmaWxsPSIjMDFhNzFjIi8+CiA8cGF0aCBkPSJtODcuNTEgMTMuMzdoMS4zMmwuMTIgMS40OWguMTJxLjk0LS40NSAxLjcyLS43OHQxLjQzLS41NGE4LjQyIDguNDIgMCAwIDEgMS4yLS4zMSA2LjU0IDYuNTQgMCAwIDEgMS4xLS4wOSAzLjMgMy4zIDAgMCAxIDIuNDguODYgMy42MyAzLjYzIDAgMCAxIC44MyAyLjYzdjkuNTFoLTEuNTl2LTlhMyAzIDAgMCAwIC0uNTUtMiAyLjE4IDIuMTggMCAwIDAgLTEuNjktLjYgNy4yNSA3LjI1IDAgMCAwIC0yLjI0LjQxIDIwLjEgMjAuMSAwIDAgMCAtMi42NyAxLjEydjEwaC0xLjU4eiIgZmlsbD0iIzAxYTcxYyIvPgogPHBhdGggZD0ibTEwMi43NSAxMC41MmEuOTMuOTMgMCAwIDEgLTEuMDYtMSAxLjA2IDEuMDYgMCAwIDEgMi4xMiAwIC45My45MyAwIDAgMSAtMS4wNiAxem0tLjggMi44NWgxLjU4djEyLjc0aC0xLjU4eiIgZmlsbD0iIzAxYTcxYyIvPgogPHBhdGggZD0ibTExMC44MSAyNi4zNHEtMy4xNCAwLTMuMTQtMy40N3YtOS41aDEuNTh2OWEzLjE2IDMuMTYgMCAwIDAgLjQ4IDIgMS45MiAxLjkyIDAgMCAwIDEuNTkuNiA2LjgzIDYuODMgMCAwIDAgMi40OC0uNDhxMS4yNS0uNDggMi41OS0xLjE0di05Ljk4aDEuNjF2MTIuNzRoLTEuMzJsLS4xMi0xLjU4aC0uMDlsLTEuNzMuODFxLS43NC4zNC0xLjM4LjU3YTcuOSA3LjkgMCAwIDEgLTEuMjMuMzMgNy4zNCA3LjM0IDAgMCAxIC0xLjMyLjF6IiBmaWxsPSIjMDFhNzFjIi8+CiA8cGF0aCBkPSJtMTIyLjE4IDEzLjM3aDEuM2wuMTQgMS40OWguMDlhMTkuNTMgMTkuNTMgMCAwIDEgMi41OC0xLjMxIDUuNTEgNS41MSAwIDAgMSAyLS40MSAyLjgzIDIuODMgMCAwIDEgMyAxLjc3aC4xMnEuOC0uNSAxLjQ1LS44M2ExMi42MSAxMi42MSAwIDAgMSAxLjItLjU0IDYuMTcgNi4xNyAwIDAgMSAxLS4zMSA1LjE4IDUuMTggMCAwIDEgMS0uMDkgMy4zIDMuMyAwIDAgMSAyLjQ1Ljg0IDMuNjMgMy42MyAwIDAgMSAuODMgMi42M3Y5LjUxaC0xLjU2di05YTIuOSAyLjkgMCAwIDAgLS41NS0yIDIuMjEgMi4yMSAwIDAgMCAtMS42OS0uNTkgNS4xNCA1LjE0IDAgMCAwIC0xLjc4LjM4IDE0LjQ1IDE0LjQ1IDAgMCAwIC0yLjE2IDEuMDl2MTAuMWgtMS42di05YTIuOSAyLjkgMCAwIDAgLS41NS0yIDIuMjEgMi4yMSAwIDAgMCAtMS42OS0uNTkgNS4yNCA1LjI0IDAgMCAwIC0xLjg2LjQgMTQgMTQgMCAwIDAgLTIuMTQgMS4wOXYxMC4xMWgtMS41OHoiIGZpbGw9IiMwMWE3MWMiLz4KIDxwYXRoIGQ9Im0yMS40NSAyMS41MWEyLjQ5IDIuNDkgMCAwIDAgLTIuNTUgMi4yMS4wOC4wOCAwIDAgMCAuMDguMWg0Ljk1YS4wOC4wOCAwIDAgMCAuMDgtLjA5IDIuNDEgMi40MSAwIDAgMCAtMi41Ni0yLjIyeiIgZmlsbD0iIzAxYTcxYyIvPgogPHBhdGggZD0ibTMyLjA2IDQuOTEtMTAuNSAxMS43OWEuMzIuMzIgMCAwIDEgLS40NyAwbC01LjM2LTUuNTNhLjMyLjMyIDAgMCAxIDAtLjRsMS43Ny0yLjI3YS4zMi4zMiAwIDAgMSAuNTIgMGwzIDMuMzJhLjMyLjMyIDAgMCAwIC40OSAwbDguMzYtMTEuNDZhLjIzLjIzIDAgMCAwIC0uMTgtLjM2aC0yOS40NGEuMjUuMjUgMCAwIDAgLS4yNS4yNXYzMy41YS4yNS4yNSAwIDAgMCAuMjUuMjVoMzJhLjI1LjI1IDAgMCAwIC4yNS0uMjV2LTI4LjY5YS4yMy4yMyAwIDAgMCAtLjQ0LS4xNXptLTIzIDI1LjM2YTguMDggOC4wOCAwIDAgMSAtNS43NC0yIC4zMS4zMSAwIDAgMSAwLS40MWwxLjI1LTEuNzVhLjMxLjMxIDAgMCAxIC40My0uMTEgNi4xNSA2LjE1IDAgMCAwIDQuMiAxLjY0YzEuNjQgMCAyLjQ0LS43NiAyLjQ0LTEuNTYgMC0yLjQ4LTguMDgtLjc4LTguMDgtNi4wNiAwLTIuMzMgMi00LjI3IDUuMzItNC4yN2E3Ljg4IDcuODggMCAwIDEgNS4yNSAxLjc2LjMxLjMxIDAgMCAxIDAgLjQzbC0xLjIzIDEuNzFhLjMxLjMxIDAgMCAxIC0uNDUuMDUgNi4wOCA2LjA4IDAgMCAwIC0zLjg0LTEuMzJjLTEuMjggMC0yIC41Ny0yIDEuNDEgMCAyLjIzIDguMDYuNzQgOC4wNiA2IDAgMi41NC0xLjgzIDQuNDgtNS42MiA0LjQ4em0xNy42Mi00Ljg3YS4yNy4yNyAwIDAgMSAtLjI4LjI4aC03LjRhLjA5LjA5IDAgMCAwIC0uMDguMSAyLjgxIDIuODEgMCAwIDAgMyAyLjMyIDQuNjIgNC42MiAwIDAgMCAyLjU2LS44NC4yNy4yNyAwIDAgMSAuNC4wNmwuOSAxLjMxYS4yOC4yOCAwIDAgMSAtLjA2LjM3IDYuNjcgNi42NyAwIDAgMSAtNC4xIDEuMjggNS4yOCA1LjI4IDAgMCAxIC01LjU3LTUuNDggNS4zMSA1LjMxIDAgMCAxIDUuNC01LjQ2YzMuMTEgMCA1LjIyIDIuMzMgNS4yMiA1Ljc0eiIgZmlsbD0iIzAxYTcxYyIvPgo8L3N2Zz4K)

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
