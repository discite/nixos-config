{ config, pkgs, ... }:

{
# 2.1 nixos-rebuild.
# Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
     niv  #To administrate management of packages in nix
     neofetch
     neovim
     htop
#    Browsers
     brave
     librewolf
  #  KDE plasma5
     libsForQt5.plasma-pa # Control de audio
     libsForQt5.kio-gdrive # Google drive mediante FUSE en plasma 
  #  Encriptacion en REST
     cryptomator
     ocamlPackages.google-drive-ocamlfuse # workaround
  #  Remote tasks
     rustdesk
  #  Chat
     armcord
     signal-desktop
     whatsapp-for-linux
  #  Development tasks
     git
     vscode
  
  ];

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    plasma-browser-integration
    print-manager
  ];

  programs.adb.enable = true;


# 2.2 channels
# No channels

# 2.3 Mirrors
# No mirrors needed at the moment

# 2.4 Flakes
# No Flakes at the moment
}
