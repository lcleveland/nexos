{ config, lib, ... }:
let
  framework = config.system.settings.framework;
in
{
  options.system.settings.framework = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable framework support";
    };
  };
  config = lib.mkIf framework.enable { };
}
