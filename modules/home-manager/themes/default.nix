{ config, lib, pkgs, ... }:

{
  # Enable gtk
  gtk = {
    enable = true;
    theme = {
      name = "Orchis-Dark";
      # package = pkgs.materia-theme;
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

  # Enable qt
  qt = {
    enable = true;

    # platform theme "gkt" or "gnome"
    platformTheme = "gtk";

    # name of the qt theme
    style.name = "adwaita-dark";

    # package to use
    style.package = pkgs.adwaita-qt;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 32;
  };
}
