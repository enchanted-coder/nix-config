{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
     })
    )
    hyprpaper
    grim
    rofi-wayland
    neofetch
    brightnessctl
    zathura
    htop
    firefox
    spotify
    qbittorrent
    discord
    kitty
    pavucontrol
    pamixer
    ventoy
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
