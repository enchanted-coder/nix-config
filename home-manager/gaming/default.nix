{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    heroic-unwrapped
  ];
}
