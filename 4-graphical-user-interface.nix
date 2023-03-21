{ config, pkgs, ... }:

{
  # nvidia
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
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      # nvidia-drm.modeset=1 is required for some wayland compositors, e.g. sway
      modesetting.enable = true;
    };
  };
}
