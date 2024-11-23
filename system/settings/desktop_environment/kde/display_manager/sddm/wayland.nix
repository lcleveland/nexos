{ config, lib, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
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
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde" && sddm.enable && sddm.wayland) {
    services.displayManager.sddm.wayland.enable = sddm.wayland;
  };
}
