{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    grim
    rofi-wayland
    neofetch
    brightnessctl
    zathura
    htop
    firefox
    # spotify
    qbittorrent
    pavucontrol
    pamixer
    ripgrep
    xdg-utils
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
