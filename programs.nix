{ config, pkgs, ... }:

{
  # Enable Steam as a program
  programs = {
    adb.enable = true;
    steam = {
      enable = true;
      #    remotePlay.openFirewall = true;
    };
    dconf.enable = true; #For some Gnome programs like gnuradio
    xwayland.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
