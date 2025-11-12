# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2025-11-12

### Fixed
- **Correct IP detection**: Now uses Home Assistant Supervisor API to get real host IP (192.168.*.*) instead of Docker internal IP (172.30.*)
- **URL display timing**: URLs now shown at END of logs after Selenium starts, eliminating need to scroll up
- **Box alignment**: Reduced separator line length from 72 to 58 characters for better proportions

### Changed
- **Improved config label**: Changed from "vnc_password_required" to "Use password to view Selenium sessions" with helpful description
- **Better startup flow**: Selenium starts in background, then displays URLs once fully ready
- **Enhanced documentation**: Added embedded Selenium logo to Documentation page using base64 data URI

### Technical
- Uses supervisor API endpoint for accurate IP detection with fallback to ip route
- 5-second wait after Selenium start before displaying URLs
- Config schema now includes name and description fields for better UX

## [1.1.3] - 2025-11-12

### Fixed
- Removed logo references from DOCS.md and README.md that weren't displaying correctly
- Documentation now renders cleanly without "Selenium Logo" placeholder text

## [1.1.2] - 2025-11-12

### Fixed
- Removed white borders from icon.png and logo.png for cleaner appearance
- Icon now displays without ugly white borders in Home Assistant add-on store

## [1.1.1] - 2025-11-12

### Changed
- **Prioritize localhost URL**: localhost:4444 is now the primary recommended URL for Home Assistant add-ons
- **Prominent URL display**: URLs now shown in bold box format in logs for easy visibility
- **Improved config label**: Changed "VNC Password Required" to "Use password to view Selenium sessions"
- **Better documentation**: Added Selenium logo to README and DOCS for visual appeal
- **Clearer examples**: All code examples now prioritize localhost for internal use

### Added
- Visual boxed display of URLs in startup logs
- Selenium logo in documentation files
- Distinction between internal (localhost) and external (IP) access

## [1.1.0] - 2025-11-12

### Changed
- **Simplified VNC configuration**: Removed confusing enable_vnc/enable_novnc options
- **Always-on session viewing**: VNC and NoVNC now enabled by default for easier debugging
- **New VNC Password option**: Simple toggle to require/disable password (default: no password)
- **Prominent URL display**: Selenium and NoVNC URLs now shown clearly in logs on startup
- **Improved documentation**: URLs and configuration explained more clearly

### Added
- Startup logs now display actual IP address for easy copy-paste
- Clear indication when password is required and what the default password is

### Breaking Changes
- Configuration options changed from `enable_vnc`/`enable_novnc` to `vnc_password_required`
- Requires add-on restart after changing password setting

## [1.0.3] - 2025-11-12

### Fixed
- Resized icon.png and logo.png to exactly 256x256 pixels for proper display in Home Assistant
- Added official Selenium horizontal logo (logo.svg)
- Fixed icon not appearing in Home Assistant add-on store

## [1.0.2] - 2025-11-12

### Fixed
- Removed build.yaml which was causing Home Assistant to use wrong base image
- Fixed Docker build error (apt-get not found) by using Selenium base image directly
- Simplified Dockerfile to use selenium/standalone-chromium:latest directly
- Temporarily limited to amd64 architecture only (ARM support coming in future release)

## [1.0.1] - 2025-11-12

### Fixed
- Removed pre-built image reference from config.yaml to enable local Docker building
- Fixed installation error (403 Forbidden) by allowing Home Assistant to build from Dockerfile
- Added official Selenium icon (icon.png and logo.png)

## [1.0.0] - 2025-11-12

### Added
- Initial release of Selenium Standalone add-on
- Support for multiple architectures (amd64, aarch64, armv7)
- Optimized configuration for low resource usage
- WebDriver API on port 4444
- Auto-start capability
- Comprehensive documentation
- UK Bin Collection Data add-on compatibility

### Configuration
- Max sessions: 3
- Session timeout: 300 seconds
- Java memory: 256MB-512MB
- VNC disabled for resource savings
- Log level: WARNING

### Technical Details
- Based on selenium/standalone-chromium:latest
- Multi-architecture support using seleniarm for ARM
- Automatic session cleanup
- Watchdog support for automatic recovery
