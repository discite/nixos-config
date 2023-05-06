{ config, lib, pkgs, modulesPath, ... }:
{
  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];
}
