{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  # Enable experimental features
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

  # Enable Grub bootloader and filesystems  
  boot = {
    supportedFilesystems = [ "ntfs" "exfat" "mtpfs" ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        extraEntries = ''
        menuentry "Reboot" {
          reboot
        }
        menuentry "Poweroff" {
          halt
        }
'';
      };
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Africa/Nairobi";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
 services.xserver = {
   enable = true;
   displayManager = {
     sddm.enable = true;
     sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
   };
 };

  # Enable hyprland
  programs.hyprland = {
    enable = true;
  };
  programs.hyprland.xwayland = {
    hidpi = true;
    enable = true;
  };
  
  environment.sessionVariables = {
    # If cursor becomes invisible
    # WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    # NIXOS_OZONE_WL = "1";
  };
  
  hardware = {
    opengl.enable = true;
    bluetooth.enable = true;
  }; 
  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;


  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    
  };

  # Enable sound with pipewire
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; 
  };  

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
   thunar-archive-plugin
   thunar-volman
  ];

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nx0enjoyer = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      # packages go here
      git 
      gh
    ];
  };
  
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Meslo LG M Regular Nerd Font Complete Mono" ];
      };
    };
    fonts = with pkgs; [ (nerdfonts.override { fonts = [ "Meslo" "JetBrainsMono" ]; }) ];
  };
  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowInsecure = true;
  nixpkgs.config.PermittedInsecurePackages = [

  ]; 

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    gcc
    gnumake
    pamixer
    alacritty
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    home-manager
  ];  
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
   
  # Enable tlp
  services.tlp.enable = true;
  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

