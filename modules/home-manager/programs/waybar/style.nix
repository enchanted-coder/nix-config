{ ... }:
let custom = {
    font = "JetBrainsMono Nerd Font";
    font_size = "15px";
    font_weight = "bold";
    text_color = "#cdd6f4";
    secondary_accent= "89b4fa";
    tertiary_accent = "f5f5f5";
    background = "11111B";
    opacity = "0.98";
};
in 
{
  programs.waybar.style = ''

    * {
        padding: 0;
        margin: 0;
        font-family: JetBrainsMono Nerd Font;
        font-size: 14px;
    }

    window#waybar {
        background-color: rgba(0, 0, 0, 0);
    }

    .modules-left {
        background-color: #1d2021;
        border-radius: 8px;
        padding-right: 15px;
        padding-left: 15px;
    }

    .modules-center {
        background-color: #1d2021;
        border-radius: 8px;
        padding-right: 10px;
        padding-left: 10px;
    }

    .modules-right {
        background-color: #1d2021;
        border-radius: 8px;
        padding-right: 15px;
        padding-left: 15px;
    }

    #custom-icon {
        font-size: 20px;
        color: #af3a03; 
        padding-right: 10px;
    }

    #cpu,
    #memory,
    #temperature {
        font-size: 14px;
        background: #282828;
        margin-top: 5px;
        margin-bottom: 5px;
    }

    #cpu {
        color: #b57614;
        padding: 0px 10px 0px 12px;
        border-radius: 5px 0px 0px 5px;
    }

    #memory {
        color: #98971a;
        padding: 0px 10px 0px 0px;
    }

    #temperature {
        color: #fe8019;
        padding: 0px 12px 0px 0px;
        border-radius: 0px 5px 5px 0px;
    }

    #custom-window-name {
        margin-right: 10px;
        color: #ebdbb2;
    }

    #workspaces button:nth-child(1) label {
        color: #076678;
        margin: 0px 8px;
    }

    #workspaces button:nth-child(2) label {
        color: #b16286;
        margin: 0px 8px;
    }

    #workspaces button:nth-child(3) label {
        color: #689d6a;
        margin: 0px 8px;
    }

    #workspaces button:nth-child(4) label {
        color: #b16286;
        margin: 0px 8px;
    }

    #workspaces button:nth-child(5) label {
        color: #bdae93;
        margin: 0px 8px;
    }

    #workspaces button:nth-child(6) label {
        color: #b57614;
        margin: 0px 8px;
    }

    #battery {
        color: #689d6a;
        margin: 0px 10px 0px 0px;
    }

    #pulseaudio,
    #backlight {
        font-size: 14px;
        background: #282828;
        margin-top: 5px;
        margin-bottom: 5px;
        color: #d79921;
        padding: 0px 10px 0px 10px;
        border-radius: 5px 0px 0px 5px;
    }

    #pulseaudio {
        color: #458588;
        padding: 0px 10px 0px 0px;
        border-radius: 0px 5px 5px 0px;
    }

    #custom-right-arr {
        color: #f2e5bc;
    }

    #network {
        color: #fe8019;
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
        color: #f2e5bc;
        background-color: #cad3f5;
        padding-right: 10px;
        margin-top: 5px;
        margin-bottom: 5px;
        border-radius: 5px;
    }
  '';
}
