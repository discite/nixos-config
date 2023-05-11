{ pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Install Steam and dependencies
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libgdiplus
        libpng12
      ];
    };
  };
  nixpkgs.hostPlatform = {
    #gcc.arch = "raptorlake";
    #gcc.tune = "tigerlake";
    system = "x86_64-linux";
    lib.mkDefault = "x86_64-linux";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  #  cores = 6;
  #  max-jobs = 2;
  };

}
