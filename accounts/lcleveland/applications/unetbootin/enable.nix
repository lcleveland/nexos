{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  unetbootin = config.accounts.lcleveland.applications.unetbootin;
in
{
  options.accounts.lcleveland.applications.unetbootin = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable unetbootin support";
    };
  };
  config = lib.mkIf (account.enable && unetbootin.enable) {
    home-manager.users.lcleveland.home.packages = [
      pkgs.unetbootin
    ];
  };
}
