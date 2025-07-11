{ ... }:

{
  # Garbage collection settings
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";

  };
  nix.settings.auto-optimise-store = true;
}
