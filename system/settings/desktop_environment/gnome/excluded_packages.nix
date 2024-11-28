{ config, lib, pkgs, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  options.system.settings.desktop_environment.gnome = {
    excluded_packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        geary
      ];
      description = "Packages to exclude from the KDE environment";
    };
  };
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "gnome") {
    environment.gnome.excludePackages = desktop_environment.gnome.excluded_packages;
    services.xserver.excludePackages = with pkgs; [ xterm ];
  };
}
