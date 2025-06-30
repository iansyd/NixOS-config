{ userSettings, ... }:

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
        ./bash.nix
        ./flatpak.nix
        #./git.nix
        ./garbage.nix
        ./onedrive.nix
        ./packages.nix
        ./sound.nix
        ./time.nix

        # And then the window manager
        ./kde.nix

    ];
}


