# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned for v0.2.0
- Powerlevel10k
- Theme system implementation
- `bspwmctl update` command
- `bspwmctl uninstall` command

## [0.2.0-beta.1] - 2026-10-25

### Fixed
- `install` no longer aborts when configuring: configs are now read from the bspwmctl directory (or `/usr/share/bspwmctl`) instead of an empty `~/.local/share/bspwmctl/config`
- Picom and Polybar configs are now applied (only when installed)
- Bundled fonts are installed to `~/.local/share/fonts/bspwmctl`
- `--theme` without a name shows an error instead of crashing
- Help text now shows `--minimal` as the default mode
- `bspwmctl --version` and `help` work as root; only commands that write to `$HOME` refuse to
- Polybar `launch.sh` no longer depends on `killall` and `$UID`, which are missing on some distros and duplicated bars on bspwm restart
- Removed deprecated and empty Polybar options (tray, throttle, `content`)

### Added
- Backups: configs that would be overwritten are saved to `~/.local/share/bspwmctl/backups/<date>/` first, and `bspwmctl restore [backup]` lists or restores them
- `.deb`, `.rpm` and Arch packages, built and tested on every release by GitHub Actions and attached to the release
- `--all` (full) mode: Thunar, Firefox, btop, mpv, zathura and the NetworkManager connection editor, with keybindings for the file manager and browser

### Changed
- **Everything is now installed from the distro's official packages** (apt, pacman, dnf) instead of being compiled from source. Installation takes seconds, and packages are updated and removed by the package manager. Binaries built from source by v0.1.0 in `/usr/local/bin` are detected and reported
- `--standard` now also installs Dunst (notifications), i3lock, Flameshot, brightnessctl, pactl, pavucontrol, xclip, Papirus icons and a polkit agent, with keybindings for lock, screenshots, volume and brightness
- `--standard` installs zsh with autosuggestions and syntax highlighting, a default `~/.zshrc` (previous one backed up) and sets it as the login shell
- On Arch, packages are installed with `pacman -Syu` to avoid partial upgrades
- Default configs are now generic: removed hardcoded monitors, personal apps, VPN and scripts not shipped with bspwmctl
- `bspwmrc` no longer re-executes bspwm, and only starts Polybar/Picom if installed
- Added `bspwm_resize` script and generic Polybar IP/VPN status scripts
- Wallpaper is read from `~/.config/bspwm/wallpaper.{png,jpg}`
- Derivatives (Linux Mint, Pop!_OS, Garuda, Nobara...) are detected through `ID_LIKE` instead of being rejected
- `--theme` is validated before installing anything; `bspwmctl theme` lists the available themes

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

[Unreleased]: https://github.com/bspwmctl/bspwmctl/compare/v0.2.0-beta.1...HEAD
[0.2.0-beta.1]: https://github.com/bspwmctl/bspwmctl/compare/v0.1.0...v0.2.0-beta.1
[0.1.0]: https://github.com/bspwmctl/bspwmctl/releases/tag/v0.1.0
