{ config, pkgs, lib, ... }:
{
  fileSystems = {
    "/" =
    { device = "/dev/disk/by-label/NixOS";
      fsType = "ext4";
    };
    "/boot/efi" =
    { device = "/dev/disk/by-partlabel/EFIBOOT";
      fsType = "vfat";
    };
    # https://www.jwillikers.com/btrfs-mount-options
    "/mnt/Compartido" =
    { device = "/dev/mapper/veracrypt-shared";
      fsType = "btrfs";
      options = [
         "defaults"
         "autodefrag"
         "compress=zstd"
    #    "user"
    #    "exec"
    #    "nohidden"
         "noatime"
    #    "uid=1000"
    #    "gid=100"
    #    "dmask=027"
    #    "fmask=137"
       ];
    };
  };
}
