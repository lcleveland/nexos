{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  config = lib.mkIf account.enable {
    home-manager.users.lcleveland.home.gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };
  };
}
