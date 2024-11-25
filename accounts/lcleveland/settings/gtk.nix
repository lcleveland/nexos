{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  config = lib.mkIf account.enable {
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
