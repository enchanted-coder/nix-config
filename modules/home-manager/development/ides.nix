{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    #android-studio
    code-cursor-fhs
  ];
}
