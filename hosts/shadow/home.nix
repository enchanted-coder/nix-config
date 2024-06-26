{ config, pkgs, ... }:

{
  
  imports = [
    ../../modules/home-manager/development
    ../../modules/home-manager/programs
  ];

  home.username = "dd0n3";
  home.homeDirectory = "/home/dd0n3";

  home.stateVersion = "24.05"; 


  home.packages = with pkgs; [
    
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
