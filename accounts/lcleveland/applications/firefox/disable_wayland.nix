{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  firefox = config.accounts.lcleveland.applications.firefox;
in
{
  options.accounts.lcleveland.applications.firefox = {
    disable_wayland = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Disable wayland for Firefox to stop crashing";
    };
  };
  config = lib.mkIf (account.enable && firefox.disable_wayland) {
    environment.variables = {
      MOZ_ENABLE_WAYLAND = 0;
    };
  };
}
