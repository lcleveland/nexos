{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  teams = config.accounts.lcleveland.applications.teams;
in
{
  options.accounts.lcleveland.applications.teams = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable teams support";
    };
  };
  config = lib.mkIf (account.enable && teams.enable) {
    home-manager.users.lcleveland.home.packages = [
      pkgs.teams-for-linux
    ];
  };
}
