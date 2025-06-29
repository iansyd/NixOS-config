{ userSettings, ... }:

{

nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

    imports = [
    ./packages.nix
    ./kde.nix
    ./fish.nix
    ./kitty.nix
    ./git.nix
    ./fastfetch
    ./zsh
    ./bat.nix
    ./btop.nix
    ./emoji.nix
    ./yazi
    ./lazygit.nix
  ];
}
