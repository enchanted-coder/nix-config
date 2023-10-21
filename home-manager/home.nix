{ config, pkgs, ... }:

let
  # gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in

{
  
  home.username = "enchanted-coder";
  home.homeDirectory = "/home/enchanted-coder";

  
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

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
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
  ];

  
  home.file = {
    

  };

 
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    git = {
      enable = true;
      userEmail = "janedoe@email.com";
      userName = "enchanted-coder";
    };
    gh.enable = true;
    lf.enable = true;
  }; 

  # Enable qt
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };

  programs.home-manager.enable = true;
}
