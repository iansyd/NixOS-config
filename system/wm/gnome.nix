{ pkgs, ... }:

{

  imports = [ ./pipewire.nix
              #./dbus.nix
              #./gnome-keyring.nix
              #./fonts.nix
            ];


  programs.dconf.enable = true;


  #environment.systemPackages = with pkgs; [
  #];


  # Enable the Gnome Desktop Environment.
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    udev.packages = [ pkgs.gnome-settings-daemon ];
  };
}
