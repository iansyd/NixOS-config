{ pkgs, ... }:

{

  imports = [ ./pipewire.nix
              #./dbus.nix
              #./gnome-keyring.nix
              #./fonts.nix
            ];


  programs.dconf.enable = true;


  environment.systemPackages = with pkgs; [
    # Extensions
    gnomeExtensions.blur-my-shell
#    gnomeExtensions.pop-shell
    gnomeExtensions.appindicator 
#    gnomeExtensions.dash-to-panel
#    gnomeExtensions.dash-to-panel-menu
    gnomeExtensions.just-perfection
    gnomeExtensions.astra-monitor
    gnomeExtensions.gsconnect

  ];


  # Enable the Gnome Desktop Environment.
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    udev.packages = [ pkgs.gnome-settings-daemon ];
  };
}
