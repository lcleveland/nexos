{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  steam = config.accounts.lcleveland.applications.steam;
in
{
  options.accounts.lcleveland.applications.steam = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable steam";
    };
  };
  config = lib.mkIf (account.enable && steam.enable) {
    programs.steam.enable = steam.enable;
  };
}
