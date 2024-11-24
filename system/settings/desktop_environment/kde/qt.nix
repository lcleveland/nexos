{ config, lib, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde") {
    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    };
  };
}
