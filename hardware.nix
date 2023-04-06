{ config, pkgs, lib, ... }:
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
    # high-resolution display
    #video.hidpi.enable = false;
    # Pipewire disable pulseaudio
    pulseaudio.enable = false;
  };
}
