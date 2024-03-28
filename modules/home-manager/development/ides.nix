{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    vscode
    jetbrains.idea-ultimate
    jetbrains-toolbox
  ];
}
