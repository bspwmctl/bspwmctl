# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned for v0.2.0
- Zsh and Powerlevel10k installation
- Full installation mode with extra applications
- Theme system implementation
- `bspwmctl update` command
- `bspwmctl uninstall` command

## [0.1.0] - 2026-02-16

### Added
- Initial release of bspwmctl
- Multi-distribution support (Debian, Ubuntu, Arch, Manjaro, Fedora and derivatives)
- Automated installation of bspwm window manager
- Automated installation of sxhkd hotkey daemon
- Kitty terminal emulator integration
- Polybar status bar installation and configuration
- Picom compositor installation and configuration
- Rofi application launcher support
- Multiple installation modes: `--minimal` and `--standard`
- `--no-dep` flag to skip dependency installation
- Basic theme system structure
- Session entry creation for display managers
- Help panel and version command
- Pre-configured dotfiles for all components

### Known Limitations
- Theme switching not yet functional
- Full installation mode not implemented
- Update and uninstall commands not implemented
- Zsh and Powerlevel10k installation pending

[Unreleased]: https://github.com/bspwmctl/bspwmctl/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/bspwmctl/bspwmctl/releases/tag/v0.1.0
