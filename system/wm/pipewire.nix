{ ... }:

{
  # Pipewire

  # RealtimeKit system service, which hands out realtime scheduling priority to user processes on
  # demand. For example, PulseAudio and PipeWire use this to acquire realtime priority.
  security.rtkit.enable = true;

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
