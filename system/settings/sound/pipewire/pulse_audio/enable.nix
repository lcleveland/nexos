{ config, lib, ... }:
let
  pulse = config.system.settings.sound.pipewire.pulse;
  pipewire = config.system.settings.sound.pipewire;
in
{
  options.system.settings.sound.pipewire.pulse = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable PulseAudio";
    };
  };
  config = lib.mkIf (pipewire.enable && pulse.enable) {
    services.pipewire.pulse.enable = pulse.enable;
  };
}
