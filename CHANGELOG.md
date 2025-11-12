# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
