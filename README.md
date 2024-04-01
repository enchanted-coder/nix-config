# Nixos Configuration

## Overview

This documentation provides an overview of the NixOS configuration setup, including flake configuration, system configuration, user configuration, and Home Manager integration.

## `flake.nix`

### Description
The `flake.nix` file serves as the main entry point for the NixOS configuration flake.

### Inputs
- `nixpkgs`: Nixpkgs repository for NixOS unstable.
- `home-manager`: Integration of Home Manager for user-specific configurations.
- `hyprland`: Package necessary for the Window Manager configuration.

### Outputs
- `nixosConfigurations`: Defines system configurations.

## `configuration.nix` (hosts/shadow)

### System Configuration
- Bootloader, Filesystems, Networking, Time Zone, Internationalization, Services, Programs, Security, Fonts, User Account.

### Home Manager Integration
- Manages user-specific configurations.

## `home.nix` (hosts/shadow)

### User Configuration
- Sets username, home directory, and additional packages.
- Defines session variables and enables Home Manager.

## `hardware-configuration.nix`

- Automatically generated file containing hardware configuration.

## Home Manager Modules

- `development/default.nix`: IDEs and development tools.
- `development/ides.nix`: IDE configurations.
- `development/tools.nix`: Development tools configurations.
- `programs/default.nix`: Miscellaneous programs.
- `programs/alacritty/default.nix`: Alacritty terminal configuration.
- `programs/misc/*.nix`: Miscellaneous program configurations.
- `programs/zsh/default.nix`: Zsh shell configuration.

## Instructions for Replication

1. **Clone the Repository**: Clone your NixOS configuration repository to your local machine.

   ```bash
   git clone https://github.com/enchanted-coder/nix-config/
   ```
   
1. **Navigate to Configuration Directory**: Move to the directory containing your NixOS configuration files.

   ```bash
   cd <repository_directory>/nixos-config/
   ```

1. **Build and Activate Configuration**: Run the following command to build and activate your NixOS configuration.

   ```bash
   nixos-rebuild switch --flake .#shadow
   ```
