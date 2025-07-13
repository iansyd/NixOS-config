{ ... }:
{

  /*
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };
  */

  imports = [
    # CLI utilities
    ./bat.nix
    ./btop.nix # cli resource monitor
    ./emoji.nix
    ./htop.nix # interactive process viewer  https://htop.dev/
    ./fastfetch
    ./eza.nix # a better ls           https://github.com/eza-community/eza
    ./lazygit.nix
    ./fzf.nix # fuzzy file finder     https://github.com/junegunn/fzf
    ./yazi
    #   ./../../home/zoxide.nix
    ./gh.nix # git hub command line  https://cli.github.com/

    # Applications
    #./../../home/firefox.nix
    #./../../home/virtmanager.nix

    # Desktop Environment
    ./kde.nix

    # Other
    ./packages.nix
    ./starship
    ./fish.nix
    ./kitty.nix
    ./git.nix

    # Scripts and some configs
    ./zsh.nix
    ./nvf.nix # neovim configuration
  ];
}
