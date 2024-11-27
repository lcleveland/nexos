{ config, lib, pkgs, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde") {
    environment.systemPackages = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };
}
