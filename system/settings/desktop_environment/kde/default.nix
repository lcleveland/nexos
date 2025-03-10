{ config, lib, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  imports = [
    ./desktop_portal.nix
    ./display_manager
    ./excluded_packages.nix
  ];
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde") {
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
