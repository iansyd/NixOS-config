
{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [


    hello # tiny hello world
    cowsay # wierd little text typer for terminal
    lolcat # wierd colouriser of text in the terminal

    home-manager

    # utilities
    bat # an alternative to cat

    dysk # a better df -H
    efibootmgr
    gparted
    mc
    neofetch
    nethogs # A small 'net top' tool that groups traffic by process to show what is using bandwith
    noto-fonts-cjk-sans #Chinese, Japanese & Korean fonts
    noto-fonts-cjk-serif #Chinese, Japanese & Korean fonts
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
    vim # An editor to edit configuration.nix
    #neovide



    # git related packages
    git
    ungit # View of git history for a folder
    github-desktop
  ];
}
