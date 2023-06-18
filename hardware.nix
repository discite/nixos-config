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
      modesetting.enable = true;
    };
    bluetooth = {
      enable = true;
    };
    steam-hardware = {
      enable = true;
    };
    # Pipewire disable pulseaudio
    pulseaudio.enable = false;
    cpu = {
      intel = {
        updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
  };
}
