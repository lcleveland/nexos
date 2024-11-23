{ config, lib, ... }:
let
  pipewire = config.system.settings.sound.pipewire;
in
{
  options.system.settings.sound.pipewire = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable pipewire";
    };
  };
  config = lib.mkIf pipewire.enable {
    services.pipewire.enable = pipewire.enable;
  };
}
