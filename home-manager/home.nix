{ config, pkgs, ... }:


{
  
  imports = [
    ./programs
    ./themes 
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

  programs = {
    git = {
      enable = true;
      userName = "enchanted-coder";
      userEmail = "danieltogey@pm.me";
    };
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


  home.packages = with pkgs; [
    grim
    slurp
    aircrack-ng
    gping
    gh
    nmap
    heroic-unwrapped
    go
    python312
    nodejs
    jdk
    mpv
    bat 
    virt-manager
    unzip
    p7zip
    gnome.file-roller
    imv
    R
    networkmanagerapplet
    iwgtk
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
     })
    )
    # alacritty
    mako 
    libnotify
    hyprpaper
    rofi-wayland
    neofetch
    brightnessctl
    zathura
    htop
    firefox
    neovim
    vscode
    spotify
    obsidian
    qbittorrent
    libreoffice-still
    obs-studio
    eww-wayland
    jetbrains.pycharm-professional
    lxmenu-data
    shared-mime-info
    cmatrix
    jetbrains.goland
  ];

  
  home.file = {
    

  };
  
  
  programs.home-manager.enable = true;
}
