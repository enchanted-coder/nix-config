{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/shadow/modules/home-manager/programs/hyprland/wallpapers/smd.jpg"
      ];
      wallpaper = [
        "eDP-1,~/shadow/modules/home-manager/programs/hyprland/wallpapers/smd.jpg"
      ];
    };
  };
}
