{ config, lib, ... }:
let
  graphics = config.system.settings.graphics;
in
{
  imports = [
    ./modesettings.nix
    ./open.nix
    ./package.nix
    ./power_management
    ./settings_menu.nix
  ];
  config = lib.mkIf (graphics.enable && graphics.enabled_graphics == "nvidia") {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
