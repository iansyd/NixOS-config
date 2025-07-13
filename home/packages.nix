{ pkgs, ... }:
{

  programs = {

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    # enable github cli
    gh.enable = true;

    btop.enable = true;

    # Trying to get command-not-found to work
    #command-not-found.enable = true; #false
    #nix-index-database.comma.enable = true;
    nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };

    # Install Neovim as the default editor
    neovim = {
      enable = true;
      defaultEditor = true;
      extraConfig = ''
        set number
        set ruler
      '';
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    #audacity
    brave # browser
    calibre
    freecad
    klavaro
    libreoffice-qt6-fresh
    marksman # for markup links in kate
    meld
    nil # analysis assistant for writing in Nix
    #notepadqq
    #onedriver
    qbittorrent
    vlc
    fish # a better terminal

    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.requests
    ]))

    # Utils
    viewnior
    catppuccin-cursors.macchiatoBlue
    catppuccin-gtk
    papirus-folders
    desktop-file-utils
    hardinfo2

    #for rust
    gcc # needed for rustup
    rustup
    #vscode-with-extensions

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
