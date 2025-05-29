{ userSettings, ... }:
{
  imports = [
    # My window manager selected from flake
    (./. + "../../../ian/modules/wm"+("/"+userSettings.wm))

    ./gtk.nix
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
