{ config, lib, ... }:
let
  graphics = config.system.settings.graphics;
in
{
  options.system.settings.graphics.nvidia = {
    modesetting = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable NVIDIA modesetting";
    };
  };
  config = lib.mkIf (graphics.enable && graphics.enabled_graphics == "nvidia") {
    hardware.nvidia.modesetting.enable = graphics.nvidia.modesetting;
  };
}
