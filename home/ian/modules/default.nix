{ userSettings, ... }:
{
  imports = [
    # My window manager selected from flake
    (./. + "../../../ian/modules/wm"+("/"+userSettings.wm))

     ./packages.nix
    ./programs.nix
    ./config.nix
    ./terminal/fish.nix
    ./terminal/kitty.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
