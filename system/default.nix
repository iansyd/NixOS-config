{ ... }:

{
  imports = [

    # hardware
    ./bluetooth.nix
    ./opengl.nix
    ./power.nix

    # security
    ./automount.nix
    ./blocklist.nix
    ./firewall.nix
    ./gpg.nix
    ./openvpn.nix

    # general
    ./automountUsb.nix
    ./starship.nix
    ./git.nix
    ./bash.nix
    ./flatpak.nix
    ./garbage.nix
    #./onedrive.nix
    ./packages.nix
    ./shells.nix # zsh and fish
    ./sound.nix

    # Desktop Environment
    ./kde.nix

  ];
}
