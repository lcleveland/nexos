{ config, lib, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  options.system.settings.desktop_environment = {
    enabled_environment = lib.mkOption {
      type = lib.types.enum [
        "kde"
      ];
      default = "kde";
      description = lib.mdDoc "The desktop environment to use";
    };
  };
  config = lib.mkIf desktop_environment.enable {
    nixpkgs.config.system.settings.desktop_environment.${desktop_environment.enabled_environment}.enable = true;
  };
}
