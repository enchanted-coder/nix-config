{ config, pkgs, lib, ... }:

{
  home.packages = lib.optionals config.programs.alacritty.enable [pkgs.nerdfonts];

  programs.alacritty = {
    enable = true;

    settings = {
      
      # Font settings
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetbrainsMono Nerd Font";
          style = "Bold Italic";
        };
        size = 11.5;
      };
      
      # Padding
      window = {
        padding = {
          x = 12;
          y = 12;
        };
      };

      # Colors
      colors = {
        primary = {
          background = "#1d2021";
          foreground = "#ebdbb2";
        };
      };

      # Cursor
      cursor = {
        style = {
          shape = "Block";
          blicking = "Off";
        };
        vi_mode_style = "Block";
        unfocused_hollow = true;
        thickness = 0.15;
      };

      mouse.hidden_when_typing = false;

    };
  };
}
