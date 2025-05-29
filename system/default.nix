{ userSettings, ... }:

{
    imports = [

        # hardware
        ./hardware/bluetooth.nix
        ./hardware/opengl.nix
        ./hardware/power.nix

        # security
        ./security/automount.nix
        ./security/blocklist.nix
        ./security/firewall.nix
        ./security/gpg.nix
        ./security/openvpn.nix

        # style

        # general
        ./general/automountUsb.nix
        ./general/bash.nix
        ./general/flatpak.nix
        ./general/garbage.nix
        #./general/onedrive.nix
        ./general/packages.nix
        ./general/programs.nix
        ./general/sound.nix
        ./general/time.nix
        ./general/users.nix

        # And then the window manager
        (./. + "../../system/wm"+("/"+userSettings.wm)+".nix") # My window manager

    ];
}


