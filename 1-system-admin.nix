{ config, pkgs, ... }:

{
# 1.1 Users and groups.
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.imurillus = {
    isNormalUser = true;
    description = "imurillus";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "adbusers"];
    packages = with pkgs; [];
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

# 1.3 Service management
# To allow tmpfs in run/user/id to use more space like in pip
  services = {
    logind.extraConfig = "RuntimeDirectorySize=4G";
    openssh = {
      enable = true;
      settings = {
#       require userpassword authentication
        passwordAuthentication = true;
        kbdInteractiveAuthentication = true;
        permitRootLogin = "no";
      };
    };
    udev.packages = [
      pkgs.android-udev-rules
    ];
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
}
