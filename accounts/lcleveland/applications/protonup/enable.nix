{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  protonup = config.accounts.lcleveland.applications.protonup;
in
{
  options.accounts.lcleveland.applications.protonup = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable protonup support";
    };
  };
  config = lib.mkIf (account.enable && protonup.enable) {
    home-manager.users.lcleveland.home.packages = [
      pkgs.protonup-qt
    ];
  };
}
