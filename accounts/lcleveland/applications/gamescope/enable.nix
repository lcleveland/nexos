{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  gamescope = config.accounts.lcleveland.applications.gamescope;
in
{
  options.accounts.lcleveland.applications.gamescope = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable gamescope support";
    };
  };
  config = lib.mkIf (account.enable && gamescope.enable) {
    home-manager.users.lcleveland.home.packages = [
      pkgs.gamescope
    ];
  };
}
