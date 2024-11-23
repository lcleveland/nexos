{ config, lib, ... }:
let
  jack = config.system.settings.sound.pipewire.jack;
  pipewire = config.system.settings.sound.pipewire;
in
{
  options.system.settings.sound.pipewire.jack = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable jack";
    };
  };
  config = lib.mkIf (pipewire.enable && jack.enable) {
    services.pipewire.jack.enable = jack.enable;
  };
}
