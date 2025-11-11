{ lib, pkgs, user, ... }:

{
  home.packages = [ pkgs.mpv ];
  home.file.".config/mpv/input.conf".source = ./config/input.conf;
}
