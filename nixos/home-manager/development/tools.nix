{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    nodejs
    python3
    jdk
    go
    bun
  ];
}
