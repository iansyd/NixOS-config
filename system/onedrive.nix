{ pkgs, ...}:

{
  # enable service for onedrive
  services.onedrive.package = pkgs.onedriver;
  services.onedrive.enable = true;
}


