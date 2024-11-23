{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  options.accounts.lcleveland.settings = {
    initial_password = lib.mkOption {
      type = lib.types.str;
      default = "changeme";
      description = "Initial password for the user";
    };
  };
  config = lib.mkIf account.enable {
    users.users.lcleveland.initialPassword = account.initial_password;
  };
}
