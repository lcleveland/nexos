{ lib, ... }:
{
  options.system.settings.desktop_environment = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable use of desktop environment";
    };
  };
}
