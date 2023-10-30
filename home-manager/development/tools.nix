{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    nodejs
    gh
    python312
    jdk
    go
    R
    bun
  ];
}
