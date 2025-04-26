# My Dotfiles

Welcome to my `.dotfiles` repository! This repository contains my personal configuration files and setup scripts to streamline and manage my development environment. It is designed primarily for a Fedora-based Linux system and includes tools like `neovim`, `zsh`, `tmux`, and more for a highly productive workflow.

---

## 🚀 Features

- **Easy Installation**: One command to set up your entire environment using the provided installation script.
- **Custom Scripts**:
  - `monitors`: Detects the number of connected monitors using `xrandr`.
  - `tmux-sessionizer`: Dynamically creates and manages `tmux` sessions.
- **Neovim Configuration**: A well-structured and modular `Neovim` configuration for efficient coding in `Lua`.
- **i3 Window Manager**:
  - Custom configurations for the i3 tiling window manager.
  - Status bar setup with `i3status`.
- **GNU Stow Integration**: Easily manage and symlink dotfiles to their respective locations.
- **Docker Environment**: Test or use your configuration in a Docker container.
- **Clean Removal**: A script to cleanly remove all configurations.
- **Cross-Tool Compatibility**: Optimized for Fedora but adaptable to other Linux distributions.

---

## 📂 Repository Structure

Here is an overview of the key directories and scripts:

- **`bin/.local/scripts`**: Custom scripts for productivity.
  - `monitors`: Counts the number of connected monitors.
  - `tmux-sessionizer`: Dynamically creates and switches between `tmux` sessions.
- **`nvim/.config/nvim`**: Neovim configuration files written in `Lua`.
- **`i3/.config/i3`**: Configuration for the i3 window manager.
- **`i3/.config/i3status`**: Status bar configuration for i3.
- **`fedora`**: Script to install the dotfiles and configure them for Fedora.
- **`clean`**: Script to remove the installed configurations.
- **`dockerfile`**: Dockerfile to create a containerized version of your environment.

---

## 🛠️ Installation

Follow these steps to install the dotfiles on your system:

```bash
cd .dotfiles
./fedora # Installs the dotfiles
```

This script will:
1. Install essential dependencies like `git`, `stow`, `zsh`, `neovim`, and `tmux`.
2. Use GNU `stow` to symlink the configuration files to their respective locations.

---

## 🧹 Cleaning the Configurations

To remove all installed configurations, run:

```bash
cd .dotfiles
./clean # Removes the configs
```

The `clean` script uses `stow` to remove the symlinked files cleanly.

---

## 🐚 Custom Scripts

### Monitor Management

The `monitors` script detects the number of connected monitors using `xrandr`:

```bash
bin/.local/scripts/monitors
```

### Tmux Sessionizer

The `tmux-sessionizer` script dynamically creates or switches between `tmux` sessions. It leverages `fzf` for fuzzy directory selection:

```bash
bin/.local/scripts/tmux-sessionizer
```

---

## 🐳 Docker Support

You can test or use the dotfiles in a Docker container. To build the image:

```bash
docker build -t dotfiles .
```

Run the container:

```bash
docker run -it dotfiles
```

The container will have a Fedora environment with the dotfiles pre-installed.

---

## 📝 Neovim Configuration

The Neovim configuration located in `nvim/.config/nvim` is written in `Lua` for performance and modularity. It includes:
- Plugins managed with a plugin manager.
- Language Server Protocol (LSP) support for multiple languages.
- Custom key bindings for faster navigation and editing.

---

## 🖥️ i3 Window Manager

Custom configurations for the i3 window manager are located in `i3/.config/i3`. Features include:
- Keybindings for efficient window management.
- Integration with `i3status` for a personalized status bar.

---

## 📦 Dependencies

The following tools are required to use this setup:
- **GNU Stow**: For managing symlinks.
- **Zsh**: Default shell for the environment.
- **Neovim**: Modern text editor.
- **Tmux**: Terminal multiplexer.
- **i3**: Tiling window manager (optional, for i3 users).
- **Docker**: To test the environment in a container.

---

## 🤝 Acknowledgments

Special thanks to the open-source community for creating amazing tools and providing inspiration for this setup. Feel free to fork this repository and customize it to suit your needs. Contributions are welcome!

---
