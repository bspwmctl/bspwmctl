<div align="center">
  <img src="../assets/logo/bspwmctl_logo2.png" width="450">

  # bspwmctl – Opinionated bspwm desktop setup

  Create and manage a fully configured bspwm environment using a simple CLI.

  <img alt="Status" src="https://img.shields.io/badge/STATUS-IN%20DEVELOPMENT-green">
  <img alt="GitHub License" src="https://img.shields.io/github/license/bspwmctl/bspwmctl?style=flat&color=red">
  <img alt="Version" src="https://img.shields.io/badge/Version-0.1.0-blue?labelColor=gray&style=flat">
  <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/bspwmctl/bspwmctl?style=flat&color=yellow">
  <img alt="Shell Script" src="https://img.shields.io/badge/Shell_Script-121011?style=flat&logo=gnu-bash&logoColor=white">
  <img alt="bspwm" src="https://img.shields.io/badge/-bspwm-2E2E2E?style=flat&logo=bspwm&logoColor=white"/>

  ---

  <img src="../assets/screenshots/bspwmctl.png">

  <em>by lukatinarelli</em>
</div>

## 📑 Table of Contents

1. [Introduction](#%EF%B8%8F-introduction)
2. [Features](#-features)
3. [Supported Distributions](#-supported-distributions)
4. [Quick Start](#-quick-start)
5. [Installation Modes](#-installation-modes)
6. [Usage](#-usage)
7. [What Gets Installed](#-what-gets-installed)
8. [Roadmap](#-roadmap)
9. [Contributing](#-contributing)
10. [License](#-license)

---

## 🏗️ Introduction

**bspwmctl** is an automated installer and manager for [bspwm](https://github.com/baskerville/bspwm)-based desktop environments. It simplifies the process of setting up a complete, opinionated bspwm workflow with all necessary tools and configurations.

Whether you're setting up a new system or want to try bspwm without manual configuration hell, bspwmctl does the heavy lifting for you.

> ⚠️ **This is a v0.1.0 alpha release.** Core functionality works, but some features are still under development. See the [Roadmap](#-roadmap) for what's coming next.

---

## ✨ Features

- 🚀 **One-command installation** of bspwm and essential tools
- 🎨 **Pre-configured setup** ready to use out of the box
- 🐧 **Multi-distro support** (Debian, Ubuntu, Arch, Fedora, and derivatives)
- 📦 **Multiple installation modes** (minimal, standard, full)
- 🎭 **Theme system** (coming in future versions)
- 🔧 **Easy management** via simple CLI commands

---

## 🐧 Supported Distributions

| Distribution Family | Tested On |
|---------------------|-----------|
| **Debian-based**    | Ubuntu, Debian, Kali Linux, Parrot OS |
| **Arch-based**      | Arch Linux, Manjaro, EndeavourOS |
| **Fedora-based**    | Fedora |

Other derivatives of these distributions should work, but haven't been extensively tested.

---

## 🚀 Quick Start

### Prerequisites

- A fresh or existing Linux installation (see supported distros above)
- **Do NOT run as root** – use a normal user with sudo privileges
- Active internet connection

### Installation

```bash
# Clone the repository
git clone https://github.com/bspwmctl/bspwmctl.git
cd bspwmctl

# Make the script executable
chmod +x bspwmctl

# Run the installer
./bspwmctl install
```

That's it! The script will:
1. Detect your distribution
2. Install all necessary dependencies
3. Compile and install bspwm components
4. Set up configurations in `~/.config/`

### Post-Installation

1. Log out of your current session
2. At the login screen, select **BSPWM** as your session
3. Log in and enjoy your new desktop environment!

---

## 📦 Installation Modes

bspwmctl offers three installation modes to fit your needs:

### 🔹 Minimal (Default)
```bash
./bspwmctl install --minimal
```
**Installs:**
- bspwm (window manager)
- sxhkd (hotkey daemon)
- kitty (terminal emulator)

Perfect for: Users who want just the essentials or plan to customize heavily.

---

### 🔸 Standard
```bash
./bspwmctl install --standard
```
**Installs everything from Minimal, plus:**
- Polybar (status bar)
- Picom (compositor for transparency/effects)

Perfect for: Most users who want a complete desktop experience.

---

### 🔶 Full *(Coming in v0.2.0)*
```bash
./bspwmctl install --all
```
Will include additional applications like VS Code, Spotify, development tools, etc.

---

## 📖 Usage

```bash
# Show help panel
bspwmctl
bspwmctl help

# Install with default settings (minimal mode)
bspwmctl install

# Install standard environment
bspwmctl install --standard

# Install without installing dependencies (advanced)
bspwmctl install --no-dep

# Apply a theme (coming soon)
bspwmctl theme <theme-name>

# Show current theme and available themes
bspwmctl theme

# Check version
bspwmctl --version
```

---

## 🛠️ What Gets Installed

### Core Components

| Component | Purpose | Repository |
|-----------|---------|------------|
| **bspwm** | Tiling window manager | [baskerville/bspwm](https://github.com/baskerville/bspwm) |
| **sxhkd** | Hotkey daemon | [baskerville/sxhkd](https://github.com/baskerville/sxhkd) |
| **kitty** | GPU-accelerated terminal | [kovidgoyal/kitty](https://github.com/kovidgoyal/kitty) |
| **Polybar** | Customizable status bar | [polybar/polybar](https://github.com/polybar/polybar) |
| **Picom** | Compositor | [yshui/picom](https://github.com/yshui/picom) |
| **Rofi** | Application launcher | [davatorium/rofi](https://github.com/davatorium/rofi) |

### File Locations

All bspwmctl files are stored in:
```
~/.local/share/bspwmctl/
├── bspwm/          # bspwm source
├── sxhkd/          # sxhkd source
├── polybar/        # Polybar source
├── picom/          # Picom source
└── config/         # Configuration files
```

User configurations are copied to:
```
~/.config/
├── bspwm/
├── sxhkd/
├── kitty/
├── polybar/
└── picom/
```

---

## 🗺️ Roadmap

### v0.1.0 (Current) ✅
- [x] Multi-distro support (Debian, Arch, Fedora families)
- [x] Minimal and Standard installation modes
- [x] Basic bspwm + sxhkd + kitty setup
- [x] Polybar and Picom integration
- [x] Session entry creation

### v0.2.0 (Planned)
- [ ] Full installation mode with extra applications
- [ ] Zsh + Powerlevel10k integration
- [ ] Theme system implementation
- [ ] `bspwmctl update` command
- [ ] `bspwmctl uninstall` command

### v0.3.0+ (Future)
- [ ] External theme repository support
- [ ] Plugin/script system
- [ ] GUI theme picker
- [ ] Configuration backup/restore
- [ ] Dotfiles sync

See the [issues page](https://github.com/bspwmctl/bspwmctl/issues) for more details and to suggest features.

---

## 🤝 Contributing

Contributions are welcome! This is an open-source project and we'd love your help making it better.

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for:
- How to report bugs
- How to suggest features
- How to contribute code
- Code guidelines

---

## 📄 License

This project is licensed under the [MIT License](../LICENSE).

---

## 💬 Support

- 🐛 **Found a bug?** [Open an issue](https://github.com/bspwmctl/bspwmctl/issues/new?labels=bug)
- 💡 **Have an idea?** [Request a feature](https://github.com/bspwmctl/bspwmctl/issues/new?labels=enhancement)
- ❓ **Questions?** [Ask in issues](https://github.com/bspwmctl/bspwmctl/issues/new?labels=question)

---

<div align="center">
  <sub>Built with ❤️ by <a href="https://github.com/lukatinarelli">lukatinarelli</a></sub>
</div>

