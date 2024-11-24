{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  icedtea = config.accounts.lcleveland.applications.icedtea;
in
{
  options.accounts.lcleveland.applications.icedtea = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable icedtea support";
    };
  };
  config = lib.mkIf (account.enable && icedtea.enable) {
    environment.systemPackages = [
      pkgs.adoptopenjdk-icedtea-web
    ];
  };
}
