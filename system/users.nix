{ config, pkgs, userSettings, ... }:

{
  users.users.ian = {
    isNormalUser = true;
    #shell = pkgs.zsh;
    description = "ian";
    extraGroups = [ "networkmanager" "wheel" "input" "dialout" "video" "render" "qemu" "kvm" "libvirtd"];
    uid = 1000;
    packages = with pkgs; [
      #kdePackages.kate
      #thunderbird
    ];
  };
}
