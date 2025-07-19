{ pkgs, ... }:
{
  imports = [
    #./pipewire.nix
    #./dbus.nix
    #./gnome-keyring.nix
    #./fonts.nix
  ];

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.konqueror
    kdePackages.kate
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
    kdePackages.partitionmanager # Optional Manage the disk devices, partitions and file systems on your computer
    #haruna # Open source video player built with Qt/QML and libmpv
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
    xclip # Tool to access the X clipboard from a console application
  ];

  # Enable the KDE Plasma Desktop Environment.
  services = {
    # This section is required for Xrdp - maybe for others too?
    xserver = {
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
}
