{ config, lib, ... }:
let
  pipewire = config.system.settings.sound.pipewire;
  rtkit = config.system.settings.sound.pipewire.rtkit;
in
{
  options.system.settings.sound.pipewire.rtkit = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable rtkit";
    };
  };
  config = lib.mkIf (pipewire.enable && rtkit.enable) {
    security.rtkit.enable = rtkit.enable;
  };
}
