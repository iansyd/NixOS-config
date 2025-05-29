{ inputs, pkgs, lib, ... }: let
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{

  # set up Hyprland Cachix (cache)
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


  # Import wayland config
  imports = [ ./wayland.nix
            ];

  environment.systemPackages = with pkgs; [
    aquamarine
    hyprpaper

    kdePackages.kio
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.konqueror
    kdePackages.kate
    kdePackages.kservice
    xdg-desktop-portal
    kdePackages.xdg-desktop-portal-kde

    kitty
    libnotify
    mako
    qt5.qtwayland
    qt6.qtwayland
    swayidle
    swaylock-effects
    wlogout
    wl-clipboard
    wofi
    waybar

  ];


  # For using KDE resources in hyprland
  environment.plasma5.excludePackages = with pkgs.kdePackages; [
    konsole
  ];

  # Security
  security = {
    pam.services.login.enableGnomeKeyring = true;
  };

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      /*xwayland = {
        enable = true;
      };
      */
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };

  services = {
    # Despite using hyprland enable the KDE Plasma Desktop Environment - all the kde programs are available
    desktopManager.plasma6.enable = true;

    gnome.gnome-keyring.enable = true;

    xserver.excludePackages = [ pkgs.xterm ];

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      theme = "chili";
      #package = pkgs.sddm;
    };
  };
}
