{ config
, pkgs
, inputs
, ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Enable Experimental Features and Package Management
  nix = {
    extraOptions = ''
      trusted-users = root danny
    '';
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
  };

  # Bootloader and Filesystems
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    # Kernel
    supportedFilesystems = [ "ntfs" "exfat" "mtpfs" ];
    loader = {
      timeout = 3;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      #  systemd-boot.enable = true;
      grub = {
        dedsec-theme = {
          enable = true;
          style = "compact";
          icon = "color";
          resolution = "1080p";
        };
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

  # Enable Networking
  networking = {
    hostName = "shadow";
    networkmanager.enable = true;
    firewall = rec {
      enable = false;
      allowedTCPPorts = [ 3074 5223 8080 ];
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
      allowedUDPPorts = [ 88 3074 3658 ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
    };
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
    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" "fbdev" ];
    };
    displayManager.ly.enable = true;
    desktopManager.plasma6.enable = true;

    # Sound with pipewire
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    # bluetooth
    #   blueman.enable = true;

    # Printing
    # printing.enable = true;

    # SSD
    fstrim.enable = true;

    # OpenSSH daemon
    # openssh.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
    kdepim-runtime
  ];

  # Security
  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
    };
  };

  hardware = {
    # OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    # Bluetooth
    bluetooth = {
      enable = false;
      powerOnBoot = false;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = false;
        };
      };
    };
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
      nerd-fonts.agave
      nerd-fonts.jetbrains-mono
      font-awesome
      powerline-fonts
      powerline-symbols
    ];
  };

  # User account
  users.users.danny = {
    isNormalUser = true;
    description = "danny";
    extraGroups = [ "adb" "docker" "libvirtd" "kvm" "networkmanager" "wheel" "disk" "power" "video" ];
    packages = with pkgs; [
      devenv
      tree
    ];
  };

  users.groups.libvirtd.members = [ "danny" ];

  virtualisation = {
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
    libvirtd.enable = true;
    kvmgt.enable = true;
    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "danny" = import ./home.nix;
    };
  };

  # Allow unfree packages and insecure packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowInsecure = true;
      allowUnsupportedSystem = true;
      PermittedInsecurePackages = [
      ];
    };
  };

  # Configure programs
  programs = {
    adb.enable = true;

    # Programs that need SUID wrappers
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment = {
    sessionVariables = {
      #NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      vim
      wget
      cmake
    ];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
    ];
  };

  #environment.sessionVariables.NIXOS_OZONE_WL = "1";
  #environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

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
  system.stateVersion = "24.11"; # Did you read the comment?
}
