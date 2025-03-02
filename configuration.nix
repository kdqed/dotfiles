# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let 
  unstable = import <nixos-unstable> { };
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
  	"hid_apple.swap_fn_leftctrl=1"
  	"hid_apple.swap_opt_cmd=1"
  ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  # Dealing with Macbook Shenanigans
  hardware.facetimehd.enable = true;
  hardware.opengl.enable = true;
  

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kd = {
    isNormalUser = true;
    description = "Karthik";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  programs.hyprland.enable = true;
  programs.firefox = {
  	enable = true;
  	package = pkgs.firefox-bin;
  };
  programs.nix-ld.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.wordlist.enable = true;
  environment.systemPackages = with pkgs; [
    # env stuff:
    swaybg
    yambar
    libnotify
    mako
    upower
    wofi
    hyprshot
    hyprlock
    hypridle
    playerctl
    brightnessctl
	gammastep
	powertop
	htop

    # basic utils
    kitty
    google-chrome
    vlc

    # file manager and utils
    yazi
    unzip
    zip
    pandoc
    ffmpeg_6-full
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    imagemagick
    wl-clipboard
    bashmount
    eject
    
	# dev stuff
    git
    unstable.lite-xl
    micro-with-wl-clipboard
    sqlite
    mongosh

    # c/c++ dev
    #gcc
    #libgcc
    #gnumake
    #cmake
    #extra-cmake-modules

    # python
    (python313.withPackages(ps: with ps; [ virtualenv ]))
    
    # for storing github credentials:
    gnupg
    pass-wayland
    git-credential-manager
    pinentry-tty
  ];

  #environment.sessionVariables = {
  #  LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  #};

  services = {
    udisks2.enable = true;
    
    mongodb = {
      enable = true;
      package = pkgs.mongodb-ce;	
    };

    logind = {
      lidSwitch = "suspend";	
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    tlp = {
      enable = false;
      settings = {
        CPU_BOOST_ON_AC = 0;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };

    thermald = {
      enable = false;
    };

	upower = {
      enable = false;
      percentageLow = 20;
      percentageCritical = 15;
      percentageAction = 14;
      criticalPowerAction = "Hibernate";
    };

    #xserver = {
    #  enable = true;
    #   
    #  desktopManager = {
    #    xterm.enable = false;
    #  };
    #    
    #  displayManager = {
    #    defaultSession = "none+i3";
    #  };
    #
    #  windowManager.i3 = {
    #    enable = true;
    #    extraPackages = with pkgs; [
    #      i3lock
    #    ];
    #  };
    #};
  };

  powerManagement.powertop.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    jost
    inconsolata
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
