{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    grim
    rofi-wayland
    brightnessctl
    zathura
    htop
    firefox
    qbittorrent
    pavucontrol
    pamixer
    ripgrep
    xdg-utils
    neofetch
    htop
    heroic
  ];
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron"
      ];
    };
  };
}
