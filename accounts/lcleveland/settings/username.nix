{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  options.accounts.lcleveland.settings = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "lcleveland";
      description = "Username for the user";
    };
  };
  config = lib.mkIf account.enable {
    home-manager.users.lcleveland.home.username = account.username;
  };
}
