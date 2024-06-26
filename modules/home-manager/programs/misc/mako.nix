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
      backgroundColor = "#dce0e8";
      borderColor = "#cba6f7";
      progressColor = "over #313244";
      textColor = "#4c4f69";
      icons = true;
      actions = true;
      extraConfig = ''
        text-alignment=center
        [urgency=high]
        border-color=#fab387
      '';
    };
  };
}