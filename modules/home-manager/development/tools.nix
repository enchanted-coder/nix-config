{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # php
    # php83Packages.composer
    nodejs
    python3
    # bun
    gcc
    gnumake
  ];
}
