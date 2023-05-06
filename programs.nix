{ config, pkgs, ... }:

{
  programs.adb.enable = true;

  # Enable Steam as a program
  programs = {
    xwayland.enable = true;
    steam = {
      enable = true;
      #    remotePlay.openFirewall = true;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
