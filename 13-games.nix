{ config, pkgs, ... }:

{
  # STEAM
  hardware = {
    steam-hardware = {
      enable = true;
    };
  };
  # Install Steam and dependencies
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libgdiplus
        libpng12
      ];
    };
  };
  # Enable Steam as a program
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
  };
}
