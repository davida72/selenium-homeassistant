# GitHub Setup and Deployment Guide

This guide will walk you through setting up this add-on on GitHub and installing it in Home Assistant.

## Prerequisites

- A GitHub account
- Git installed on your computer
- Home Assistant instance running

## Step 1: Customize the Files

Before pushing to GitHub, update these files with your information:

### 1.1 Update repository.json
```json
{
  "name": "Selenium Standalone Add-on Repository",
  "url": "https://github.com/davida72/selenium-homeassistant",
  "maintainer": "Your Name <your.email@example.com>"
}
```

### 1.2 Update config.yaml
Change the image line:
```yaml
image: ghcr.io/davida72/{arch}-selenium-standalone
```

### 1.3 Update build.yaml
Add your GitHub username to the labels:
```yaml
labels:
  org.opencontainers.image.source: "https://github.com/davida72/selenium-homeassistant"
```

### 1.4 Update README.md and DOCS.md
Replace all instances of:
- `https://github.com/davida72/selenium-homeassistant` with your actual repository URL
- Update the maintainer information

### 1.5 Update LICENSE
Replace `[Your Name]` with your actual name

## Step 2: Create GitHub Repository

### 2.1 Create the Repository
1. Go to [GitHub](https://github.com/)
2. Click the "+" icon → "New repository"
3. Name it: `selenium-homeassistant`
4. Description: "Selenium Standalone service for Home Assistant"
5. Choose "Public" (required for Home Assistant add-on repositories)
6. DO NOT initialize with README (we already have one)
7. Click "Create repository"

### 2.2 Push Your Code

From the `Selenium-HomeAssistant` directory:

```bash
# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Selenium Standalone add-on v1.0.0"

# Add remote (replace davida72)
git remote add origin https://github.com/davida72/selenium-homeassistant.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Optional - Add Icon

For a professional look, add an icon:

1. Create or find a 256x256 PNG icon
2. Name it `icon.png`
3. Place it in the root directory
4. Commit and push:
   ```bash
   git add icon.png
   git commit -m "Add add-on icon"
   git push
   ```

## Step 4: Install in Home Assistant

### 4.1 Add Repository to Home Assistant

1. Open Home Assistant
2. Navigate to **Settings** → **Add-ons** → **Add-on Store**
3. Click the **⋮** menu (three dots, top right)
4. Select **Repositories**
5. Add your repository URL:
   ```
   https://github.com/davida72/selenium-homeassistant
   ```
6. Click **Add**

### 4.2 Install the Add-on

1. Refresh the Add-on Store page
2. Scroll down to find "Selenium Standalone"
3. Click on it
4. Click **Install**
5. Wait for installation to complete (may take 5-10 minutes on first install)

### 4.3 Start the Add-on

1. Go to the **Info** tab
2. Click **Start**
3. Enable **Start on boot** (recommended)
4. Enable **Watchdog** (recommended)
5. Check the **Log** tab to verify it's running

## Step 5: Test the Installation

### 5.1 Check if Selenium is Running

From another device on your network, try:
```bash
curl http://homeassistant.local:4444/status
```

You should see a JSON response with Selenium status.

### 5.2 Test with UK Bin Collection Data Add-on

1. Install UK Bin Collection Data add-on
2. In its configuration, set:
   ```
   selenium_url: http://homeassistant.local:4444/
   ```
3. Start the add-on
4. Check logs for successful Selenium connection

## Troubleshooting Setup

### Repository not appearing in Home Assistant

**Solutions:**
- Ensure repository is public
- Check the URL is correct
- Refresh your browser
- Check Home Assistant logs for errors

### Build fails during installation

**Common causes:**
- Architecture not supported (check your system architecture)
- Insufficient disk space (need at least 2GB free)
- Network timeout (try again)

**Solutions:**
- Check Home Assistant supervisor logs
- Ensure stable internet connection
- Wait and retry installation

### Add-on won't start

**Check:**
- System has at least 512MB free RAM
- Port 4444 is not in use
- Architecture is supported (amd64, aarch64, armv7)

## Updating the Add-on

When you make changes:

```bash
# Update version in config.yaml
# Update CHANGELOG.md

git add .
git commit -m "Version X.X.X: Description of changes"
git push

# In Home Assistant, go to the add-on and click "Update"
```

## Local Development/Testing

To test locally before pushing to GitHub:

### Option 1: Local Add-on Development

1. Copy the entire directory to Home Assistant:
   ```bash
   scp -r /Users/davidamor/GitHub/Selenium-HomeAssistant \
     root@homeassistant.local:/addons/selenium-standalone
   ```

2. In Home Assistant:
   - Settings → Add-ons → Add-on Store
   - ⋮ menu → Check for updates
   - Look for "Local Add-ons" section

### Option 2: Test with Docker

```bash
# Build the image
docker build -t selenium-standalone-test .

# Run it
docker run -d -p 4444:4444 selenium-standalone-test

# Test
curl http://localhost:4444/status

# Stop
docker stop $(docker ps -q --filter ancestor=selenium-standalone-test)
```

## GitHub Actions (Optional)

For automated building, create `.github/workflows/builder.yaml`:

```yaml
name: Build Add-on

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build add-on
        uses: home-assistant/builder@master
        with:
          args: |
            --all \
            --test
```

## Support and Contributing

- Report issues on GitHub: Issues tab
- Submit improvements: Pull requests welcome
- Ask questions: Home Assistant Community Forum

## Next Steps

After successful installation:

1. Test with a simple WebDriver script
2. Configure other add-ons to use it
3. Monitor resource usage
4. Consider contributing improvements back to the project

---

Congratulations! Your Selenium Standalone add-on is now set up and ready to use.
