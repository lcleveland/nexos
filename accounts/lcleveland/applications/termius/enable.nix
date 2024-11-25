{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  termius = config.accounts.lcleveland.applications.teams;
in
{
  options.accounts.lcleveland.applications.termius = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable termius support";
    };
  };
  config = lib.mkIf (account.enable && termius.enable) {
    home-manager.users.lcleveland.home.packages = [
      pkgs.termius
    ];
  };
}
