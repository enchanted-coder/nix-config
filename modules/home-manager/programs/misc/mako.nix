{ config, pkgs, ... }: 
{
  services = {
    mako = {
      enable = true;
      font = "JetBrainsMono Nerd Font 12";
      padding = "15";
      defaultTimeout = 5000;
      borderSize = 2;
      borderRadius = 5;
      backgroundColor = "#1d2021";
      borderColor = "#cc241d";
      progressColor = "over #458588";
      textColor = "#ebdbb2";
      icons = true;
      actions = true;
      extraConfig = ''
        text-alignment=center
        [urgency=high]
        border-color=#9d0006
      '';
    };
  };
}
