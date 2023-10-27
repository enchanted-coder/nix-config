{ config, pkgs, ... }:

let
  # gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in

{
  
  home.username = "nx0enjoyer";
  home.homeDirectory = "/home/nx0enjoyer";

  
  home.stateVersion = "23.05"; 

   
  # enable gtk
  gtk = {
    enable = true;
    theme = {
      package = pkgs.materia-theme;
      name = "Materia-dark-compact";
    };
    iconTheme = {
      package = pkgs.paper-icon-theme;
      name = "Paper";
    };
  };

  # configure cursor  
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 22;
  };
  
  # configure git
  programs = {
    git = {
      enable = true;
      userName = "enchanted-coder";
      userEmail = "danieltogey@pm.me";
    };
  };
 
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  # enable lf file manager
  programs = {
    lf.enable = true;
  }; 

  # Enable qt
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
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
    alacritty
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
