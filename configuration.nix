# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let

  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };

in {

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "plexus"; # Define your hostname.

  fonts.fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts
      dina-font
      proggyfonts
  ];

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Bogota";

  programs.fish.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
      wget
      vim
      neovim
      fish    
      ranger
      htop
      st
      gitAndTools.gitFull
      file
      freecad
      vlc
      blender
      openscad
      antimony
      inkscape
      firefox
      dropbox
      tmux
      nmap
      ffmpeg-full
      mosh
      curl
      fdupes
      whois
      youtube-dl
      gimp
      audacity
      sox
      lmms
      fontforge
      obs-studio
      traceroute
      bind
      python3
      lsof
      pulseaudioFull
      irssi
      unstable.discord
      unstable.slack
      unstable.zoom-us
      unstable.google-chrome
      unstable.vscode
      unstable.hyper
      unstable.nodejs-8_x
      unstable.yarn
      (pkgs.callPackage ./now-cli.nix {})
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable sound.
  sound.enable = true;
  boot.extraModprobeConfig = "options snd-hda-intel id=SB index=0";
  hardware.pulseaudio.enable = true;

  # This is a work-around for i3blocks
  environment.pathsToLink = [ "/libexec" ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    xkbOptions = "grp:alt_space_toggle, ctrl:nocaps";

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nhill = {
    isNormalUser = true;
    shell = pkgs.fish;
    home = "/home/nhill";
    description = "Nathaniel Hill";
    extraGroups = [ "wheel" "audio" ];
    uid = 1000;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?

}
