{ pkgs, ... }:

{

  imports = [ ./pipewire.nix
              #./dbus.nix
              #./gnome-keyring.nix
              #./fonts.nix
            ];

  environment.systemPackages = with pkgs; [
    gnome-extension-manager
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pop-shell
    gnomeExtensions.appindicator 
    gnomeExtensions.arcmenu
    gnomeExtensions.dash-to-panel
#    gnomeExtensions.arcmenu
    gnome-tweaks
    dconf
    dconf-editor

    # for app menu extension
    gnome-menus
    xdg-utils
    xdg-user-dirs-gtk
    gettext

  ];

  programs.dconf.enable = true;

  # Enable the Gnome Desktop Environment.
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    udev.packages = [ pkgs.gnome-settings-daemon ];
  };
}
