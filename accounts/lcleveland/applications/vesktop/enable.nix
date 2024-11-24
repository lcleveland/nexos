{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  vesktop = config.accounts.lcleveland.applications.vesktop;
in
{
  options.accounts.lcleveland.applications.vesktop = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable vesktop support";
    };
  };
  config = lib.mkIf (account.enable && vesktop.enable) {
    environment.systemPackages = [
      pkgs.vesktop
    ];
  };
}
