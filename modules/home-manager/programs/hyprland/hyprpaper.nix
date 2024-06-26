{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/shadow/modules/home-manager/programs/hyprland/wallpapers/nix-magenta-pink.png"
      ];
      wallpaper = [
        "eDP-1,~/shadow/modules/home-manager/programs/hyprland/wallpapers/nix-magenta-pink.png"
      ];
    };
  };
}
