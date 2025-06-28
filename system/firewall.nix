{ ... }:

{
  # Firewall
  networking.firewall.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22000 #printing to hp lounge printer
    21027 #printing to hp lounge printer
    18230 #qbittorrent
  ]; # syncthing

  networking.firewall.allowedUDPPorts = [
    22000 #printing to hp lounge printer
    21027 #printing to hp lounge printer
    18230 #qbittorrent
  ]; # syncthing

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # refer to system/hardware/printing<?>.nix for additional firewall
  # rules related to printing
}
