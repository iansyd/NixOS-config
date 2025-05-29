# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# To rebuild:
# $ sudo nixos-rebuild switch

{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{

  # Ensure nix flakes are enabled
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  time = {
    timeZone = "Pacific/Auckland"; # time zone
    hardwareClockInLocalTime = false;
  };

  networking = {
	hostName = "jupiterH470-nvme";
	networkmanager.enable = true;
	enableIPv6 = false;
	#firewall.enable = false;
	useDHCP = lib.mkDefault true;
	# networking.interfaces.eno1.useDHCP = lib.mkDefault true;
	# networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;
  };

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix    # Standard auto-config file
    ./other-file-systems.nix        # file systems specific to this host
    ../../system                    # Standard modules - red from default.nix in this folder
  ];

  # Windows boot loader attempt that does work
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  # Used instead of doas
  #security.sudo.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # enable service for onedrive
  #services.onedrive.package = pkgs.onedriver;
  #services.onedrive.enable = true;


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on
  # older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system -
  # see https://nixos.org/manual/nixos/stable/#sec-upgrading for how to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to
  # your configuration, and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or
  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "24.11"; # DANGER - Did you read the comment?
}
