{ pkgs, ... }:
{

  # Enable remmina.
  services.remina = {
    enable = true;
    package = pkgs.remmina;
    addRdpMimeTypeAssoc = true;
  };

  # Enable freerdp.
  environment.systemPackages = [
    pkgs.freerdp
  ];
}
