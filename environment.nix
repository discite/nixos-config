{ config, pkgs, ... }:

{

  environment.etc = {
    # https://delightlylinux.wordpress.com/2021/05/20/automount-veracrypt-with-crypttab/
    "crypttab" = {
      text = "veracrypt-shared    /dev/disk/by-partlabel/SHARED    /dev/null    tcrypt-veracrypt,tcrypt-keyfile=/etc/cryptsetup-keys.d/veracrypt-shared";
    }; 
  };
  # 2.1 nixos-rebuild.
  environment.systemPackages = with pkgs; [
    gnome.gnome-disk-utility
    #niv #To administrate management of packages in nix
    #  KDE plasma5
    #libsForQt5.plasma-pa # Control de audio
    #libsForQt5.kio-gdrive # Google drive mediante FUSE en plasma
    #libsForQt5.xdg-desktop-portal-kde
    #libsForQt5.krfb
    #libsForQt5.kdeconnect-kde
  ];

  #Workaround Electron Apps on Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  #environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  #  elisa
  #  #gwenview
  #  okular
  #  oxygen
  #  khelpcenter
  #  plasma-browser-integration
  #  print-manager
  #];
}
