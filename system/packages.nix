
{ config, pkgs, ... }:

{
  programs = {

  # Install Browser.
    #firefox.enable = true;
    chromium.enable = true;

    # htop
    htop.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    brave

    hello # tiny hello world
    cowsay # wierd little text typer for terminal
    lolcat # wierd colouriser of text in the terminal

    home-manager

    # utilities
    bat # an alternative to cat
    dysk # a better df -H
    efibootmgr
    fastfetch
    flatpak
    gnugrep
    gparted
    hardinfo2
    kitty
    mc
    #neofetch
    nethogs # A small 'net top' tool that groups traffic by process to show what is using bandwith
    #nixfmt-rfc-style     # Nix style formater
    noto-fonts-cjk-sans # Chinese, Japanese & Korean fonts
    noto-fonts-cjk-serif # Chinese, Japanese & Korean fonts
    os-prober # For finding the windows boot loader when creatign the boot menu
    p7zip # provider of 7zip
    qdirstat
    tealdeer # tldr provider
    tree
    wget
    wl-clipboard

    cmatrix # simulate matix chars
    unimatrix

    #Editor
    neovim # An editor to edit configuration.nix

    # git related packages
    git
    ungit # View of git history for a folder
    github-desktop
  ];
}
