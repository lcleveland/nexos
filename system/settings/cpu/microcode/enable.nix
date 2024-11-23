{ config, lib, ... }:
let
  microcode = config.system.settings.cpu.microcode;
  vendor = config.system.settings.cpu.vendor;
in
{
  options.system.settings.cpu.microcode = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable microcode";
    };
  };
  config = lib.mkIf microcode.enable {
    hardware.cpu.${vendor}.updateMicrocode = microcode.enable;
  };
}
