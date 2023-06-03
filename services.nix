{ pkgs, ... }:
{
  # 1.3 Service management
  # To allow tmpfs in run/user/id to use more space like in pip
  services = {
    logind.extraConfig = "RuntimeDirectorySize=4G";
    #openssh = {
    #  enable = true;
    #  settings = {
    #    #require userpassword authentication
    #    passwordAuthentication = true;
    #    kbdInteractiveAuthentication = true;
    #    permitRootLogin = "no";
    #  };
    #};
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
        sddm.enable = true;
        defaultSession = "plasma";
        # gdm = {
        #   wayland = true;
        #   enable = true;
        # };
      };
      desktopManager.plasma5 = {
        enable = true;
        #excludePackages = with pkgs.libsForQt5; [
          #elisa
          #gwenview
          #okular
          #oxygen
          #khelpcenter
          #plasma-browser-integration
          #print-manager
        #];
      };
      desktopManager.gnome.enable = false;
      layout = "us";
      xkbVariant = "";
      videoDrivers = [ "nvidia" ];
    };
    # Enable CUPS to print documents.
    printing.enable = true;
    # Firmware Update daemon
    fwupd.enable = true;
    #syncthing = {
    #    enable = true;
    #    user = "imurillus";
    #    dataDir = "/mnt/shared/Defecto";    # Default folder for new synced folders
    #    configDir = "/home/imurillus/.config/syncthing";   # Folder for Syncthing's settings and keys
    #    extraOptions.gui = {
    #      user = "imurillus";
    #      password = "changeme";
    #    };
    #};
  };
}

##AUDIO NEED TO RESEARCH MORE DEFAULT IN GNOME
# Enable sound with pipewire.
#  sound.enable = true;
#  hardware.pulseaudio.enable = false;
#  security.rtkit.enable = true;

