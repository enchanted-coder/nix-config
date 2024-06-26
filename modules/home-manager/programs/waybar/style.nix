{ ... }:
let custom = {
    font = "JetBrainsMono Nerd Font";
    font_size = "14px";
    font_weight = "bold";
    crust = "#dce0e8";
    base = "#eff1f5";
    mantle = "#e6e9ef";
    lavender = "#7287fd";
    mauve = "#8839ef";
    peach = "#fe640b";
    red = "#d20f39";
    sapphire = "#209fb5";
    green = "#40a02b";
    teal = "#179299";
    flamingo = "#dd7878";
    opacity = "0.98";
};
in 
{
  programs.waybar.style = ''

    * {
        padding: 0;
        margin: 0;
        font-family: ${custom.font};
        font-size: ${custom.font_size};
        font-weight: ${custom.font_weight};
    }

    window#waybar {
        background-color: rgba(0, 0, 0, 0);
    }

    .modules-left {
        background-color: ${custom.crust};
        border-radius: 8px;
        padding-right: 15px;
        padding-left: 15px;
    }

    .modules-center {
        background-color: ${custom.crust};
        border-radius: 8px;
        padding-right: 10px;
        padding-left: 10px;
    }

    .modules-right {
        background-color: ${custom.crust};
        border-radius: 8px;
        padding-right: 15px;
        padding-left: 15px;
    }

    #custom-icon {
        font-size: 20px;
        color: ${custom.lavender}; 
        padding-right: 10px;
        margin-right: 5px;
    }

    #cpu,
    #memory,
    #temperature {
        font-size: 14px;
        background: ${custom.mantle};
        margin-top: 5px;
        margin-bottom: 5px;
    }

    #cpu {
        color: ${custom.peach};
        padding: 0px 10px 0px 12px;
        border-radius: 5px 0px 0px 5px;
    }

    #memory {
        color: ${custom.sapphire};
        padding: 0px 10px 0px 0px;
    }

    #temperature {
        color: ${custom.red};
        padding: 0px 12px 0px 0px;
        border-radius: 0px 5px 5px 0px;
    }

    #window {
        margin-right: 10px;
        margin-left: 10px;
        color: ${custom.lavender};
    }

    #workspaces button:nth-child(1) label {
        color: ${custom.peach};
        margin: 0px 8px;
    }

    #workspaces button:nth-child(2) label {
        color: ${custom.green};
        margin: 0px 8px;
    }

    #workspaces button:nth-child(3) label {
        color: ${custom.red};
        margin: 0px 8px;
    }

    #workspaces button:nth-child(4) label {
        color: ${custom.lavender};
        margin: 0px 8px;
    }

    #workspaces button:nth-child(5) label {
        color: ${custom.sapphire};
        margin: 0px 8px;
    }

    #workspaces button:nth-child(6) label {
        color: ${custom.mauve};
        margin: 0px 8px;
    }

    #battery {
        color: ${custom.green};
        margin: 0px 10px 0px 0px;
    }

    #pulseaudio,
    #backlight {
        font-size: 14px;
        background: ${custom.mantle};
        margin-top: 5px;
        margin-bottom: 5px;
        color: ${custom.peach};
        padding: 0px 10px 0px 10px;
        border-radius: 5px 0px 0px 5px;
    }

    #pulseaudio {
        color: ${custom.teal};
        padding: 0px 10px 0px 0px;
        border-radius: 0px 5px 5px 0px;
    }

    #custom-right-arr {
        color: ${custom.flamingo};
    }

    #network {
        color: ${custom.green};
        margin-right: 10px;
    }

    #custom-dot {
        color: #6e738d;
        padding-left: 10px;
        padding-right: 10px;
    }

    #custom-dot-alt {
        color: #a5adcb;
        padding-left: 10px;
        padding-right: 10px;
    }

    #clock {
        padding-left: 10px;
        color: ${custom.lavender};
        background-color: ${custom.base};
        padding-right: 10px;
        margin-top: 5px;
        margin-bottom: 5px;
        border-radius: 5px;
    }
  '';
}