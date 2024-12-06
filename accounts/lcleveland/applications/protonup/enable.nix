{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  zoom = config.accounts.lcleveland.applications.zoom;
in
{
  options.accounts.lcleveland.applications.zoom = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable zoom support";
    };
  };
  config = lib.mkIf (account.enable && zoom.enable) {
    home-manager.users.lcleveland.home.packages = [
      pkgs.zoom-us
    ];
  };
}
