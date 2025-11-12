# Selenium Icon Setup

## Icon Provided

You've provided the official Selenium icon (green with white "Se" and checkmark). This needs to be saved as image files for the add-on.

## How to Save the Icon

### Option 1: Save from Chat (Recommended)
1. Right-click on the Selenium icon image in the chat above
2. Select "Save Image As..."
3. Navigate to: `/Users/davidamor/GitHub/Selenium-HomeAssistant/`
4. Save it twice with these names:
   - `icon.png`
   - `logo.png`

### Option 2: Download from Selenium Website
1. Visit https://www.selenium.dev/
2. Right-click the Selenium logo
3. Save as `icon.png` and `logo.png` in the project directory

## Required Format
- **Format**: PNG with transparency
- **Size**: Ideally 256x256 pixels (will be resized automatically if different)
- **Location**: Root of the repository (same folder as config.yaml)

## Verify Icon Installation

After saving, run:
```bash
ls -la /Users/davidamor/GitHub/Selenium-HomeAssistant/icon.png
ls -la /Users/davidamor/GitHub/Selenium-HomeAssistant/logo.png
```

Both files should appear in the listing.

## Final Git Commands

After saving the icon files:
```bash
cd /Users/davidamor/GitHub/Selenium-HomeAssistant
git add icon.png logo.png
git commit -m "Add Selenium icon and logo"
git push
```

The icon will then appear in the Home Assistant add-on store!
