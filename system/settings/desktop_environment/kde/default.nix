{ config, lib, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  imports = [
    ./browser_integration.nix
    ./display_manager
  ];
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde") {
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
