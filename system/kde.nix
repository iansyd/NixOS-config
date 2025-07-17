{ pkgs, ... }:

{

  imports = [
    #./pipewire.nix
    #./dbus.nix
    #./gnome-keyring.nix
    #./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.konqueror
    kdePackages.kate
  ];

  # Enable the KDE Plasma Desktop Environment.
  services = {
    xserver = {
      # Enable the X11 windowing system.
      # You can disable this if you're only using the Wayland session.
      enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    desktopManager.plasma6.enable = true;
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true; # maybe?
        autoNumlock = true;
      };
    };
  };

  programs.kdeconnect.enable = true;

}
