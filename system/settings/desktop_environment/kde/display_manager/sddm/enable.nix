{ config, lib, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
  sddm = config.system.settings.desktop_environment.kde.display_manager.sddm;
in
{
  options.system.settings.desktop_environment.kde.display_manager.sddm = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable SDDM as the display manager";
    };
  };
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde" && sddm.enable) {
    services.displayManager.sddm.enable = sddm.enable;
  };
}
