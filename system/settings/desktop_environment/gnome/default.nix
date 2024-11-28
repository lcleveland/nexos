{ config, lib, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  imports = [
    ./excluded_packages.nix
    ./triple_buffering.nix
  ];
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "gnome") {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
