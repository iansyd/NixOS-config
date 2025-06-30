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
    ./git.nix
    ./fastfetch
    ./zsh.nix
    ./bat.nix
    ./btop.nix
    ./emoji.nix
    ./yazi
    ./lazygit.nix
  ];
}
