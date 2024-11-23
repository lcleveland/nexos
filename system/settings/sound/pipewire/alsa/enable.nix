{ config, lib, ... }:
let
  alsa = config.system.settings.sound.pipewire.alsa;
  pipewire = config.system.settings.sound.pipewire;
in
{
  options.system.settings.sound.pipewire.alsa = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable alsa";
    };
  };
  config = lib.mkIf (pipewire.enable && alsa.enable) {
    services.pipewire.alsa.enable = alsa.enable;
  };
}
