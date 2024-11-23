{ config, lib, ... }:
let
  kde = config.system.settings.desktop_environment.kde;
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
  config = lib.mkIf (kde.enable && sddm.enable) {
    services.displayManager.sddm.enable = sddm.enable;
  };
}
