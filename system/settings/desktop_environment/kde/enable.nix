{ config, lib, ... }:
let
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
  config = lib.mkIf kde.enable {
    services.xserver.enable = kde.enable;
    services.desktopManager.plasma6.enable = kde.enable;
  };
}
