{ config, pkgs, ... }:

{
  # Bootloader.
  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      #   Enable autoresolution on bootloader
      systemd-boot.consoleMode = "auto";
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    # Specify the kernel to use
    kernelPackages = pkgs.linuxPackages_6_3;
    initrd = {
      secrets = {
        "/crypto_keyfile.bin" = null;
      };
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
      luks = {
        devices = {
          # Enable swap on luks
          "luksSWAP" = {
            device = "/dev/disk/by-partlabel/SWAP";
            keyFile = "/crypto_keyfile.bin";
          };
          "luksROOT" = {
            device = "/dev/disk/by-partlabel/ROOT";
          };
        };
      };
    };
  };
}
