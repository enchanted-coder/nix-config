{ config, pkgs, ... }:

{
  
  imports = [
    ../../modules/home-manager/development
    ../../modules/home-manager/programs
  ];

  home.username = "dd0n3";
  home.homeDirectory = "/home/dd0n3";

  home.stateVersion = "23.11"; 


  home.packages = with pkgs; [
    
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron"
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
