{ pkgs, pkgs-unstable, ... }:
{

 # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    #audacity
    brave # browser
    calibre
    freecad
    klavaro
    libreoffice-qt6-fresh
    meld
    #microsoft-edge # depreciated
    #teams
    notepadqq
    onedriver
    qbittorrent
    vlc
    fish # a better terminal

    (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.pip
        python-pkgs.requests
    ]))

    # Utils
    viewnior
    hyprshot
    catppuccin-cursors.macchiatoBlue
    catppuccin-gtk
    papirus-folders
    desktop-file-utils

    #for rust
    gcc # needed for rustup
    rustup
    vscode-with-extensions

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}

