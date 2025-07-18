{ ... }:

{
  services = {
    xserver.enable = true;
    # displayManager.sddm.enable = true; # required, but already part of kde config
    # desktopManager.plasma6.enable = true; # required, but already part of kde config
    xrdp = {
      enable = true;
      defaultWindowManager = "startplasma-x11";
      openFirewall = true;
    };
  };

  # don't auto sleep
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };
}
