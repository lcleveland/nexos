{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  quickemu = config.accounts.lcleveland.applications.quickemu;
in
{
  options.accounts.lcleveland.applications.quickemu = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable quickemu support";
    };
  };
  config = lib.mkIf (account.enable && quickemu.enable) {
    home-manager.users.lcleveland.home.packages = [
      pkgs.quickemu
    ];
  };
}
