{ config, pkgs, ... }:

{
  # 2.1 nixos-rebuild.
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    niv #To administrate management of packages in nix
    neofetch
    neovim
    htop
    tmux
    #    Browsers
    brave
    librewolf
    chromium
    #  KDE plasma5
    libsForQt5.plasma-pa # Control de audio
    libsForQt5.kio-gdrive # Google drive mediante FUSE en plasma 
    #libsForQt5.xdg-desktop-portal-kde
    pkgs.libsForQt5.krfb
    libsForQt5.kdeconnect-kde
    #  Encriptacion en REST
    cryptomator
    ocamlPackages.google-drive-ocamlfuse # workaround
    #  Remote tasks
    #rustdesk
    #xdg-desktop-portal     
    #  Chat
    armcord
    signal-desktop
    whatsapp-for-linux
    #  Development tasks
    git
    vscode
    nixpkgs-fmt
    rust-analyzer
    rustfmt
    clippy
    cargo
    rustc
    #  shitcoin
    monero-cli
    monero-gui
    p2pool
    xmrig
  ];

  # Install Steam and dependencies
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libgdiplus
        libpng12
      ];
    };
  };

  #Workaround Electron Apps on Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";


  nixpkgs.hostPlatform = {
    #gcc.arch = "raptorlake";
    #gcc.tune = "tigerlake";
    system = "x86_64-linux";
    lib.mkDefault = "x86_64-linux";
  };

  #nix.settings = {
  #  cores = 6;
  #  max-jobs = 2;
  #};

  #environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  #  elisa
  #  #gwenview
  #  okular
  #  oxygen
  #  khelpcenter
  #  plasma-browser-integration
  #  print-manager
  #];

  programs.adb.enable = true;

  # Enable Steam as a program
  programs = {
    steam = {
      enable = true;
      #    remotePlay.openFirewall = true;
    };
    ssh.askPassword = "ksshaskpass";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

}
