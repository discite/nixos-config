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
    initrd.luks.devices."luks-9974056c-5b3b-42f3-b668-544f7dbfd0a4".device = "/dev/disk/by-uuid/9974056c-5b3b-42f3-b668-544f7dbfd0a4";
    initrd.luks.devices."luks-9974056c-5b3b-42f3-b668-544f7dbfd0a4".keyFile = "/crypto_keyfile.bin";
  };
}
