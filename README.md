# Config

A modular NixOS flake-based configuration managing system and user environments for desktop and laptop hardware.

## Structure

```
nixos/
├── flake.nix              # Main entry point
├── modules/
│   ├── infra/             # Flake infrastructure
│   ├── hosts/             # Per-host configurations
│   │   ├── desktop/       # Desktop with NVIDIA GPU
│   │   └── thinkpad/      # ThinkPad laptop
│   ├── nixos/             # System-level modules
│   └── home/              # Home-manager modules
```

## Hardware Profiles

### Desktop
- NVIDIA GPU with proprietary drivers
- Intel CPU with microcode updates
- Full desktop environment with GPU acceleration

### ThinkPad
- Intel CPU with KVM support
- TLP power management with battery thresholds (40-80%)
- Lid switch suspend/lock behavior
- Brightness control via brightnessctl

## Features

### Desktop Environment
- **Hyprland** - Wayland compositor with vim-like keybindings
- **Waybar** - Floating pill-style status bar
- **Wofi** - Application launcher
- **greetd/tuigreet** - TUI login manager
- **Hyprlock/Hypridle** - Lock screen and idle management

### Development
- **NixVim** - Neovim with LSP (Lua, Rust, Nix), Telescope, Treesitter
- **Rust toolchain** - cargo, rustc
- **Tools** - ripgrep, fd, git

### Theming (Oxocarbon)
- **Terminal** - foot with JetBrains Mono NF
- **GTK** - Vimix Dark (Doder)
- **Cursor** - Bibata Modern Classic
- **Colors** - Centralized color module for consistency

### Audio
- PipeWire with PulseAudio compatibility

## Keybindings

| Binding | Action |
|---------|--------|
| `Super + Return` | Terminal (foot) |
| `Super + D` | App launcher (wofi) |
| `Super + Q` | Kill window |
| `Super + 1-0` | Switch workspace |
| `Super + H/J/K/L` | Focus direction |
| `Super + Shift + 1-0` | Move to workspace |
| `Super + V` | Toggle floating |
| `Super + E` | File manager |
| `Super + S` | Screenshot |

## Usage

```bash
# Build and switch to configuration
sudo nixos-rebuild switch --flake ./nixos#desktop
sudo nixos-rebuild switch --flake ./nixos#thinkpad

# Update flake inputs
nix flake update ./nixos
```

## Dependencies

- NixOS 25.11
- home-manager (release-25.11)
- flake-parts
- nixvim
