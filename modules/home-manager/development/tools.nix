{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # php
    # php83Packages.composer
    nodePackages_latest.nodejs
    (python312Full.withPackages(ps: with ps; [ pygobject3 gobject-introspection pyqt6-sip]))
    # bun
    gcc
    gnumake
    license-generator
    inetutils    
  ];
}
