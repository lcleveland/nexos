{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  options.accounts.lcleveland.settings = {
    state_version = lib.mkOption {
      type = lib.types.str;
      default = "24.05";
      description = "The state version to use for the user";
    };
  };
  config = lib.mkIf account.enable {
    home-manager.users.lcleveland.home.stateVersion = account.state_version;
  };
}
