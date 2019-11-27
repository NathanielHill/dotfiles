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
      ./hosts.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
      gimp
      audacity
      sox
      lmms
      fontforge
      obs-studio
      traceroute
      bind
      lsof
      pulseaudioFull
      irssi
      pulsemixer
      zathura
      feh
      scrot
      mpd
      mpc_cli
      ncmpcpp
      mpv
      newsboat
      parted
      gparted
      neomutt
      pass
      sdcv
      mtools
      unrar
      binutils-unwrapped
      patchelf
      jmtpfs
      unzip
      shellcheck
      dash
      mksh
      zsh
      lf
      vifm
      w3m
      transmission
      exiftool
      kid3
      skanlite
      imagemagick7Big
      tree
      abiword
      go-sct
      pavucontrol
      sxiv
      zip
      gnuplot
      dropbox
      dropbox-cli
      sloc
      paprefs
      neofetch
      unstable.kjv
      unstable.nodejs
      unstable.yarn
      unstable.tdesktop
      unstable.kbfs
      unstable.keybase
      unstable.keybase-gui
      unstable.chromium
      unstable.rclone
      unstable.python37Packages.youtube-dl
      unstable.discord
      unstable.slack
      unstable.zoom-us
      unstable.google-chrome
      unstable.vscode
      unstable.hyper
      unstable.skypeforlinux
      (pkgs.callPackage ./now-cli.nix {})
      (python36Full.withPackages(
            ps: with ps;
            [ setuptools ]
      ))
  ];

  programs.light.enable = true;

  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint ];
  hardware.sane.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  #services.openssh.forwardX11 = true;
  #programs.ssh.forwardX11 = true;
  #programs.ssh.setXAuthLocation = true;

  services.mpd = {
    enable = true;
    musicDirectory = "/home/nhill/Dropbox/Music";
    playlistDirectory = "/home/nhill/Dropbox/Music/playlists";
    dataDir = "/home/mpd/.mpd";

    # user = "nhill";
    group = "users";

    extraConfig = ''
      audio_output {
        type "pulse"
        name "pulse audio"
      }
      '';
  };

  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = 1;
    "net.ipv4.conf.default.forwarding" = 1;
    "net.ipv4.conf.eno1.route_localnet" = 1;
  };

  networking.hostName = "plexus"; # Define your hostname.
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "8.8.4.4" ];

  networking.nat = {
    enable = true;
    internalIPs = [ "127.0.0.1" ];
    internalInterfaces = [ "lo" ];
    externalInterface = "eno1";
    forwardPorts = [
      {
        sourcePort = 80;
        destination = "127.0.0.1:3000";
      }
    ];
  };

  networking.firewall = {
    enable = true;
    allowPing = true;
    trustedInterfaces = [ "lo" ];

    # Open ports in the firewall.
    allowedTCPPorts = [
      22
      80
      3000
      5000
    ];

    # allowedUDPPorts = [ ... ];
  };

  # Enable sound.
  sound.enable = true;
  #boot.extraModprobeConfig = "options snd-hda-intel id=SB index=0";
  boot.extraModprobeConfig = "options snd-hda-intel enable=0";
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.systemWide = true;

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

    xrandrHeads = [
      {
        output = "DP1";
        monitorConfig = ''
          Option "LeftOf" "DP2"
        '';
      }
      {
        output = "DP2";
      }
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nhill = {
    isNormalUser = true;
    shell = pkgs.fish;
    home = "/home/nhill";
    description = "Nathaniel Hill";
    extraGroups = [ "wheel" "audio" "mpd" "video" "lp" "scanner" ];
    uid = 1000;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?


  fileSystems."/mnt/CarPod" = {

    device = "/dev/disk/by-uuid/585A-0F57";
    options = [ "nofail,user,umask=0000" ];

  };

  fileSystems."/mnt/SpeakerPod" = {

    device = "/dev/disk/by-uuid/DC0E-40AC";
    options = [ "nofail,user,umask=0000" ];

  };

  fileSystems."/Backup" = {

    device = "/dev/disk/by-uuid/9726f2a0-8eca-430c-a2d4-85b243f7e947";
    options = [ "nofail,user" ];
  };

  fileSystems."/home/nhill/Dropbox" = {

    device = "/dev/disk/by-uuid/a7045a85-86a3-4848-890e-1079b6071ab3";
    options = [ "nofail,user" ];
  };

}
