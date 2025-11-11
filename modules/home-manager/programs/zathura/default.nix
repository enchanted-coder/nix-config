{ lib, pkgs, user, ... }:

{
  home.packages = [ pkgs.zathura ];
  home.file.".config/zathura/zathurarc".source = ./zathurarc;
}