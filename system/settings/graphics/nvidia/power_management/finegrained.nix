{ config, lib, ... }:
let
  graphics = config.system.settings.graphics;
in
{
  options.system.settings.graphics.nvidia.power_management = {
    finegrained = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc "Enable fine grained power management";
    };
  };
  config = lib.mkIf (graphics.enable && graphics.enabled_graphics == "nvidia") {
    hardware.nvidia.powerManagement.finegrained = graphics.nvidia.power_management.finegrained;
  };
}
