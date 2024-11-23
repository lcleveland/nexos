{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  firefox = config.accounts.lcleveland.applications.firefox;
in
{
  options.accounts.lcleveland.applications.firefox = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Firefox";
    };
  };
  config = lib.mkIf (account.enable && firefox.enable) {
    home-manager.users.lcleveland.programs.firefox.enable = firefox.enable;
  };
}
