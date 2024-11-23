{ config, lib, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
  kde = config.system.settings.desktop_environment.kde;
in
{
  options.system.settings.desktop_environment.kde = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the KDE desktop environment.";
    };
  };
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde") {
    services.xserver.enable = kde.enable;
    services.desktopManager.plasma6.enable = kde.enable;
  };
}
