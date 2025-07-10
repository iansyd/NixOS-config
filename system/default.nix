{ ...}:

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

    # style

    # general
    ./automountUsb.nix
    ./starship.nix
    ./git.nix
    ./bash.nix
    ./flatpak.nix
    ./garbage.nix
    #./onedrive.nix
    ./packages.nix
    ./shells.nix      # zsh and fish
    ./sound.nix
    ./time.nix
    #./users.nix

    # And then the window manager
    ./kde.nix

  ];
}


