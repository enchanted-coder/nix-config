{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    jetbrains.pycharm-professional
    jetbrains.goland
    vscode
    neovim
  ];
}
