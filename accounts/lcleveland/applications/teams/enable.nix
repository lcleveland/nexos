{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  teams = config.accounts.lcleveland.applications.lazygit;
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
    environment.systemPackages = [
      pkgs.teams-for-linux
    ];
  };
}
