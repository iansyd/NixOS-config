{ ... }:
#{ config, pkgs, lib, ... }:

{
/* gpskwlkr-orig
	# Switched to lanzaboote Secure Boot
	# boot = {
	# kernelParams = ["nohibernate" "ipv6.disable=1"];
	# tmp.cleanOnBoot = true;
	# supportedFilesystems = ["ntfs"];
	# loader = {
	# 	grub = {
	# 		device = "nodev";
	# 		efiSupport = true;
	# 		enable = true;
	# 		useOSProber = true;
	# 		timeoutStyle = "menu";
	# 		efiInstallAsRemovable = true;
	# 		extraConfig = ''
	# 			insmod tpm
	# 		'';
	# 	};
	# 	timeout = 300;
	# };
	# };

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
*/

  # Original Bootloader.
  #  boot.loader .systemd-boot.enable = true;
  #  boot.loader.efi.canTouchEfiVariables = true;

  # Bootloader from librephoenix
  # Use systemd-boot if uefi, default to grub otherwise
  #boot.loader.systemd-boot.enable = if (systemSettings.bootMode == "uefi") then true else false;
  #boot.loader.efi.canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
  #boot.loader.efi.efiSysMountPoint = systemSettings.bootMountPath; # does nothing if running bios rather than uefi
  #boot.loader.grub.enable = if (systemSettings.bootMode == "uefi") then false else true;
  #boot.loader.grub.device = systemSettings.grubDevice; # does nothing if running uefi rather than bios

  # Windows boot loader attempt that does work
  /*boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };
*/


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
}
