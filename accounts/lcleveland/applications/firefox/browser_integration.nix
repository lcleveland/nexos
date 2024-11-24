{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  firefox = config.accounts.lcleveland.applications.firefox;
in
{
  options.accounts.lcleveland.applications.firefox = {
    browser_integration = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Firefox browser integration";
    };
  };
  config = lib.mkIf (account.enable && firefox.enable && firefox.browser_integration) {
    home-manager.users.lcleveland.programs.firefox.nativeMessagingHosts = [ pkgs.libsForQt5.plasma-browser-integration ];
  };
}
