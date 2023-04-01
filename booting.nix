{ config, pkgs, ... }:

{
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
  #   Enable autoresolution on bootloader
      systemd-boot.consoleMode = "auto";
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    initrd.secrets = {
    "/crypto_keyfile.bin" = null;
    };
    # Specify the kernel to use
    kernelPackages = pkgs.linuxPackages_6_2;
    # Enable swap on luks
    initrd.luks.devices."luks-36d7ab0f-38cf-4b72-8d84-c885ad3a2eb2".device = "/dev/disk/by-uuid/36d7ab0f-38cf-4b72-8d84-c885ad3a2eb2";
    initrd.luks.devices."luks-36d7ab0f-38cf-4b72-8d84-c885ad3a2eb2".keyFile = "/crypto_keyfile.bin";
  };
}
