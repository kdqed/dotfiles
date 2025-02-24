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
    packages = with pkgs; [
      (python313.withPackages(ps: with ps; [ virtualenv ]))
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  programs.hyprland.enable = true;


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

    hyprlock

    # basic utils
    kitty
    google-chrome
    vlc

    # file manager and utils
    yazi
    unzip
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
    
    # for storing github credentials:
    gnupg
    pass-wayland
    git-credential-manager
    pinentry-tty
  ];

  services = {
    upower = {
      enable = false;
      percentageLow = 25;
      percentageCritical = 15;
      percentageAction = 10;
      criticalPowerAction = "PowerOff";
    };

    udisks2.enable = true;
    
    mongodb = {
      enable = true;
      package = pkgs.mongodb-ce;	
    };

    logind = {
      lidSwitch = "suspend";	
    };

    #postgresql = {
    #  enable = true;
    #  ensureDatabases = [ "ferretdb" ];
    #  enableTCPIP = true;
    #  port = 5432;
    #  authentication = pkgs.lib.mkOverride 10 ''
        #...
    #   #type database DBuser origin-address auth-method
    #    local all       all     trust
    #    # ipv4
    #    host  all      all     127.0.0.1/32   trust
    #    # ipv6
    #    host all       all     ::1/128        trust
    #  '';
    #  initialScript = pkgs.writeText "backend-initScript" ''
    #    CREATE ROLE nixpostgres WITH LOGIN PASSWORD 'nixpostgres' CREATEDB;
    #    CREATE DATABASE nixpostgres;
    #    GRANT ALL PRIVILEGES ON DATABASE nixpostgres TO nixpostgres;
    #    GRANT ALL PRIVILEGES ON DATABASE ferretdb TO nixpostgres;
    #  '';
    #};
    
    #ferretdb = {
    #  enable = true;
    #  settings = {
      	#FERRETDB_HANDLER = "sqlite";
       	#FERRETDB_SQLITE_URL = "file:/var/lib/ferretdb/sqlite_data/";
    #   	FERRETDB_POSTGRESQL_URL = "postgresql://nixpostgres:nixpostgres@127.0.0.1:5432/ferretdb";
    #  };
    #};
  };

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
