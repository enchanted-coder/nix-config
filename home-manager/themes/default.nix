{ config, lib, pkgs, ... }:

{
  
  gtk = {
    enable = true;
    
    theme = {
      name = "Materia-dark-compact";
      package = pkgs.materia-theme;
    }; 

    iconTheme = {
      name = "Paper";
      package = pkgs.paper-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };

}
