{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  system = config.system.settings.nix.host_platform;
  zen_browser = config.accounts.lcleveland.applications.zen_browser;
in
{
  options.accounts.lcleveland.applications.zen_browser = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable zen browser support";
    };
  };
  config = lib.mkIf (account.enable && zen_browser.enable) {
    home-manager.users.lcleveland.home.packages = [
      zen_browser.packages.${system}.default
    ];
  };
}
