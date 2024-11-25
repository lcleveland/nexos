{ config, lib, ... }:
let
  framework = config.system.settings.framework;
in
{
  options.system.settings.framework = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable framework support";
    };
  };
  config = lib.mkIf framework.enable {
    services.fwupd.enable = framework.enable;
  };
}
