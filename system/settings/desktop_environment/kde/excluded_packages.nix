{ config, lib, pkgs, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  options.system.settings.desktop_environment.kde = {
    excluded_packages = lib.mkOption {
      type = lib.types.listOf lib.types.pkgs;
      default = with pkgs.kdePackages; [
        kate
      ];
      description = "Packages to exclude from the KDE environment";
    };
  };
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde") {
    environment.plasma6.excludePackages = desktop_environment.kde.excluded_packages;
  };
}
