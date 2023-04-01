{ config, pkgs, ... }:
{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      setLdLibraryPath = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    steam-hardware = {
      enable = true;
    };
  };
}
