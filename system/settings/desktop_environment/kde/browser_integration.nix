{ config, lib, pkgs, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  options.system.settings.desktop_environment.kde = {
    browser_integration = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable KDE Browser Integration";
    };
  };
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde") {
    environment.systemPackages = [
      pkgs.kdePackages.plasma-browser-integration
    ];
  };
}
