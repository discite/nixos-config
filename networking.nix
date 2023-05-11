{ lib, ... }:
{
  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  networking.hostName = "nixosrig"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 8384 22000 ];
    allowedUDPPorts = [ 3478 4379 4380 22000 21027 ];
    allowedTCPPortRanges = [
      { from = 27000; to = 27100; }
    ];
    allowedUDPPortRanges = [
      { from = 27000; to = 27100; }
    ];
  };
}
