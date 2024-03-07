{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    vscode
    neovim
    android-studio
    jetbrains.idea-community
  ];
}
