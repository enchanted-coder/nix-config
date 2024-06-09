{ lib, inputs, ... }: 
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      right_format = "$cmd_duration";
      
      directory = {
        format = "[ ](bold #98971a)[ $path ]($style)";
        style = "bold #689d6a";
      };

      character = {
        success_symbol = "[ ](bold #d65d0e)[ ➜](bold green)";
        error_symbol = "[ ](bold #89b4fa)[ ➜](bold red)";
        # error_symbol = "[ ](bold #89dceb)[ ✗](bold red)";
      };

      cmd_duration = {
        format = "[]($style)[[󰔚 ](bg:#282828 fg:#d4c097 bold)$duration](bg:#282828 fg:#BBC3DF)[ ]($style)";
        disabled = true;
        style = "bg:none fg:#282828";
    };        

      directory.substitutions = {
        "~" = "󰋞";
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };

      
    } // builtins.fromTOML (builtins.readFile "${inputs.catppuccin-starship}/palettes/mocha.toml");
  };
}
