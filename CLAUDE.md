# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Nix flake-based dotfiles repository using Home Manager to manage user environments across multiple systems (WSL, NixOS, macOS). The repository uses GNU Stow for symlinking configuration files.

## Architecture

### Flake Structure

The flake.nix defines three homeConfigurations:
- `wsl`: Linux x86_64 system for WSL (username: devn, /home/devn)
- `nixos`: Linux x86_64 system for NixOS (username: devon, /home/devon)
- `work`: macOS x86_64 system (username: devwalker, /Users/devwalker)

All configurations use nixpkgs 23.11 as the base with nixpkgs-unstable available via `pkgs-unstable`. Each configuration passes `system` and `env` as extraSpecialArgs to modules.

### Module Hierarchy

- `system/common.nix`: Base package definitions shared across all systems
- `system/{wsl,nixos,macos}/home.nix`: System-specific configurations that import common.nix and add platform-specific packages
- `dots/`: Application-specific dotfiles organized for GNU Stow
- `env/`: Environment-specific configurations (e.g., env/personal)

## Common Commands

### Home Manager Operations

Build and switch to a new configuration:
```bash
# Set your system type first
export DOTFILES_SYSTEM=wsl  # or nixos, work
home-manager switch --impure --flake .#${DOTFILES_SYSTEM}
```

Or use the Makefile:
```bash
make switch_hm DOTFILES_SYSTEM=wsl
```

Initial Home Manager installation:
```bash
make install_hm DOTFILES_SYSTEM=wsl
```

### Dotfiles Management

Stow all dotfiles to $HOME:
```bash
make dots
```

Stow personal environment configs:
```bash
make env-personal
```

### Shell Setup

Install and set zsh as default shell:
```bash
make install_shell
```

For WSL specifically (as documented in README):
1. Remove Windows Terminal shortcut for Ctrl+Tab
2. Create .zprofile that sources nix and .zshrc
3. Link and change default shell:
```bash
ln -s /home/devn/.nix-profile/bin/zsh /usr/bin/zsh
chsh -s /usr/bin/zsh
```

## Development Workflow

### Making Configuration Changes

1. Edit the relevant .nix file:
   - Package changes: `system/common.nix` or system-specific home.nix
   - New system config: Add to flake.nix homeConfigurations
2. Run `home-manager switch --impure --flake .#<system>` to apply
3. Commit changes to git

### Adding New Packages

Add to `system/common.nix` for all systems, or to the specific `system/{wsl,nixos,macos}/home.nix` for platform-specific packages. Use `pkgs-unstable` when you need newer versions.

### Adding New Dotfiles

1. Create a directory in `dots/` for the application
2. Inside, create the config file structure starting from `.config/` or home directory
3. Run `make dots` to stow

## Key Directories

- `dots/`: Individual application configurations (nvim, tmux, zsh, alacritty, vscode, etc.)
- `system/`: Nix modules for different systems
- `env/`: Environment-specific configurations
- `apps/`: Application-related files
- `bin/`: Custom scripts

## Important Notes

- The `--impure` flag is required for home-manager switch due to the extraSpecialArgs usage
- Dotfiles use GNU Stow with `--no-folding` to avoid creating symlinks at directory level
- The flake uses both stable (23.11) and unstable nixpkgs channels
- Some packages are commented out in common.nix (e.g., obsidian due to electron security issues)
