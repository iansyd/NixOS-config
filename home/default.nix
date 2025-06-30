{ userSettings, ... }:

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
    ./packages.nix
    ./kde.nix
    ./starship
    ./fish.nix
    ./kitty.nix
    ./eza.nix      # a better ls           https://github.com/eza-community/eza
    ./fzf.nix      # fuzzy file finder     https://github.com/junegunn/fzf
    ./git.nix
    ./gh.nix       # git hub command line  https://cli.github.com/
    ./htop.nix     # interactive process viewer  https://htop.dev/
    ./fastfetch
    ./zsh.nix
    ./bat.nix
    ./btop.nix     # cli resource monitor
    ./emoji.nix
    ./yazi
    ./lazygit.nix
    ./nvf.nix      # neovim configuration
  ];
}
