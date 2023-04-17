{ config, pkgs, ... }:

{
  # 1.1 Users and groups.
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.imurillus = {
    isNormalUser = true;
    description = "imurillus";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "adbusers" ];
    packages = with pkgs; [
      #    Browsers
      brave
      librewolf
      chromium
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
      ## shitcoin
      # monero-cli
      # monero-gui
      # p2pool
      # xmrig
    ];
  };

  # 1.2 Security
  # Use doas as replacing of sudo
  security = {
    sudo.enable = false;
    rtkit.enable = true;
    doas = {
      enable = true;
      # Configure doas
      extraRules = [{
        groups = [ "wheel" ];
        keepEnv = true;
        persist = true;
      }];
    };
  };

  # 1.4 System maintenance
  # 1.4.3 Upgrading the system
  # Allow autoupgrade   
  system.autoUpgrade.enable = true;
  # 1.4.5
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # X.X Timezone
  # Set your time zone.
  time.timeZone = "America/Lima";

  # X.X Localization
  # Select internationalisation properties.
  i18n.defaultLocale = "es_PE.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_PE.UTF-8";
    LC_IDENTIFICATION = "es_PE.UTF-8";
    LC_MEASUREMENT = "es_PE.UTF-8";
    LC_MONETARY = "es_PE.UTF-8";
    LC_NAME = "es_PE.UTF-8";
    LC_NUMERIC = "es_PE.UTF-8";
    LC_PAPER = "es_PE.UTF-8";
    LC_TELEPHONE = "es_PE.UTF-8";
    LC_TIME = "es_PE.UTF-8";
  };


}

