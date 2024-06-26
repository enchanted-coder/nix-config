{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.nerdfonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.twemoji-color-font
    pkgs.noto-fonts-emoji

  ];

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    iconTheme = {
      name = "Papirus-Light";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "latte";
        accent = "mauve";
      };
    };

    theme = {
      name = "Catppuccin-Latte-Compact-Mauve-Light";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        # tweaks = [ "rimless" ];
        variant = "latte";
      };
    };

    cursorTheme = {
      name = "Catppuccin-Latte-Mauve-Cursors";
      package = pkgs.catppuccin-cursors.latteMauve;
      size = 16;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "kvantum";
    };
  };

  home.pointerCursor = {
    name = "Catppuccin-Latte-Mauve-Cursors";
    package = pkgs.catppuccin-cursors.latteMauve;
    size = 16;
  };
}
