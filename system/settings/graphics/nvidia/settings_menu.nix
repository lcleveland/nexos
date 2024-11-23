{ config, lib, ... }:
let
  graphics = config.system.settings.graphics;
in
{
  options.system.settings.graphics.nvidia = {
    settings_menu = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Whether to use nvidia settings menu";
    };
  };
  config = lib.mkIf (graphics.enable && graphics.enabled_graphics == "nvidia") {
    hardware.nvidia.nvidiaSettings = graphics.nvidia.settings_menu;
  };
}
