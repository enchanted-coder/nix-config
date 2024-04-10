{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Enable Experimental Features and Package Management
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaulTimeoutStopSec=10s";

  # Bootloader and Filesystems
  boot = {
    supportedFilesystems = [ "ntfs" "exfat" "mtpfs" ];
    loader = {
      timeout = 1;
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
    initrd.systemd.enable = true;
   
  };

  # Enable Networking
  networking = {
    hostName = "shadow";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Africa/Nairobi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Services
  services = {
    # Desktop Environment
    # xserver = {
      # enable = true;
      # displayManager.sddm.enable = true;
    # };
    # desktopManager.plasma6.enable = true;

    # Sound with pipewire
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    # Printing
    # printing.enable = true;

    # File Management
    gvfs.enable = true;
    tumbler.enable = true;

    # SSD
    fstrim.enable = true;

    # OpenSSH daemon
    # openssh.enable = true;
    
  };

  # Enable Window Manager
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      xwayland.enable = true;
    };
  };

  # pipewire
  security.rtkit.enable = true;
  
  # OpenGL
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Fonts
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Meslo LG M Regular Nerd Font Complete Mono" ];
      };
    };
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "Meslo" "JetBrainsMono" "Agave" ]; })
      font-awesome
      powerline-fonts
      powerline-symbols
    ];
  };

  # User account
  users.users.dd0n3 = {
    isNormalUser = true;
    description = "dd0n3";
    extraGroups = [ "networkmanager" "wheel" "disk" "power" "video" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "dd0n3" = import ./home.nix;
    };
  };

  # Allow unfree packages and insecure packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowInsecure = true;
      PermittedInsecurePackages = [

      ];
    };
  };

  # Configure programs
  programs = {
    # Shell
    zsh.enable = true;

    # Thunar 
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    # KDE Connect 
    # kdeconnect.enable = true;

    # Programs that need SUID wrappers
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  

  
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
   vim
   wget
  ];

  # xdg
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-hyprland
      # xdg-desktop-portal-gtk
    ];
    wlr.enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
