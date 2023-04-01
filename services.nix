{ config, pkgs, ... }:

{

# 1.3 Service management
# To allow tmpfs in run/user/id to use more space like in pip
  services = {
    logind.extraConfig = "RuntimeDirectorySize=4G";
    openssh = {
      enable = true;
      settings = {
        #require userpassword authentication
        passwordAuthentication = true;
        kbdInteractiveAuthentication = true;
        permitRootLogin = "no";
      };
    };
    udev.packages = [
      pkgs.android-udev-rules
    ];
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
        gdm.wayland = true;
        defaultSession = "plasmawayland";
      };      
      desktopManager.plasma5 = {
        enable = true;
      };
      layout = "us";
      xkbVariant = "";
      videoDrivers = [ "nvidia" ];
    };
  };
}