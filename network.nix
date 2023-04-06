{ config, pkgs, ... }:
{
  # X.X Networking
  networking.firewall.allowedTCPPorts = [
    18080 #Monero P2P
    37888 #P2Pool
    37889 #P2Pool mini port
  ];
  networking.hostName = "nixosrig"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;
}


