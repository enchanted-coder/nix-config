{ config, pkgs, system, inputs, ... }:
let
  system = "x86_64-linux";
in
{
  imports = [
    ../../modules/home-manager/development
    ../../modules/home-manager/programs
  ];

  home.username = "danny";
  home.homeDirectory = "/home/danny";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = [
    inputs.zen-browser.packages."${system}".beta
    inputs.gitfetch.packages.${system}.default
    #inputs.cursor.packages.${pkgs.system}.default
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "kitty";
    BROWSER = "zen";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
