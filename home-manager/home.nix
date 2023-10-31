{ config, pkgs, ... }:


{
  
  imports = [
    ./programs
    ./themes
    ./development
    ./gaming
  ];

  home.username = "nx0enjoyer";
  home.homeDirectory = "/home/nx0enjoyer";

  
  home.stateVersion = "23.05"; 
  
  # configure cursor  
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 22;
  };


  services.mako = {
    enable = true;
    backgroundColor = "#1d2021";
    borderColor = "#427b58";
    borderRadius = 5;
    borderSize = 2;
    textColor = "#a89984";
    layer = "overlay";
  };
 
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    lf.enable = true;
  }; 

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
  ];

  home.packages = with pkgs; [
    discord
    grim
    slurp
    aircrack-ng
    gping
    gh
    nmap
    mpv
    virt-manager
    unzip
    p7zip
    gnome.file-roller
    imv
    networkmanagerapplet
    iwgtk
    wirelesstools
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
     })
    )
    mako 
    libnotify
    hyprpaper
    rofi-wayland
    neofetch
    brightnessctl
    zathura
    htop
    firefox
    spotify
    obsidian
    qbittorrent
    libreoffice-still
    obs-studio
    eww-wayland
    lxmenu-data
    shared-mime-info
    cmatrix
  ];

  
  home.file = {
    

  };
  
  
  programs.home-manager.enable = true;
}
