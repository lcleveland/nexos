{ config, lib, ... }:
let
  kde = config.system.settings.desktop_environment.kde;
  sddm = config.system.settings.desktop_environment.kde.display_manager.sddm;
in
{
  options.system.settings.desktop_environment.kde.display_manager.sddm = {
    wayland = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Use Wayland for the display manager";
    };
  };
  config = lib.mkIf (kde.enable && sddm.enable && sddm.wayland) {
    services.displayManager.sddm.wayland.enable = sddm.wayland;
  };
}
