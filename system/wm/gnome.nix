{ pkgs, ... }:

{

  imports = [ ./pipewire.nix
              #./dbus.nix
              #./gnome-keyring.nix
              #./fonts.nix
            ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pop-shell
    dconf
    dconf-editor
  ];

  programs.dconf.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
}
