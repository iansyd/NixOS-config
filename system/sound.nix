{ pkgs, ... }:

{
  security.rtkit.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false; # renamed from hardware.pulseaudio.enable as per nixos-rebuild recomendation
  services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
        wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
  ];
}
