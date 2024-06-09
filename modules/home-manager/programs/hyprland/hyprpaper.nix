{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/pictures/gruv-material.png"
      ];
      wallpaper = [
        "eDP-1,~/pictures/gruv-material.png"
      ];
    };
  };
}
