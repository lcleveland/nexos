{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  enabled_environment = config.system.settings.desktop_environment.enabled_environment;
in
{
  config = lib.mkIf (account.enable && enabled_environment == "kde") {
    home-manager = {
      backupFileExtension = "hm-backup";
      users.lcleveland.gtk = {
        enable = true;
        theme = {
          name = "Adwaita-dark";
          package = pkgs.gnome-themes-extra;
        };
      };
    };
  };
}
