# Add-on Icon

Home Assistant add-ons should include the following icon files:

## Required Files

- `icon.png` - 256x256 pixels, PNG format
- `logo.png` - 256x256 pixels, PNG format (optional, but recommended)

## Icon Guidelines

1. **Size**: Exactly 256x256 pixels
2. **Format**: PNG with transparency
3. **Design**: Simple, recognizable icon that represents Selenium/browser automation
4. **Colors**: Should work well on both light and dark backgrounds

## Suggestions

You can use:
- The official Selenium logo (check licensing)
- A browser icon with automation elements
- A custom icon using tools like:
  - [Canva](https://www.canva.com/)
  - [GIMP](https://www.gimp.org/)
  - [Photopea](https://www.photopea.com/)

## Where to Place

Save the icon files in the root directory of this repository:
```
selenium-homeassistant/
├── icon.png          <- Add here
├── logo.png          <- Add here (optional)
├── config.yaml
├── Dockerfile
└── ...
```

## Quick Icon Creation

If you need a quick placeholder:
1. Go to https://www.canva.com/
2. Create a 256x256 pixel design
3. Add text "Se" or a browser icon
4. Export as PNG
5. Save as `icon.png` in the root directory

The add-on will work without an icon, but it will look more professional with one.
