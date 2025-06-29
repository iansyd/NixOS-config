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
  ];
}
