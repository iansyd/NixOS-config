{ pkgs, ...}: {

environment.systemPackages = [
    pkgs.remmina
    pkgs.freerdp
  ];
}
