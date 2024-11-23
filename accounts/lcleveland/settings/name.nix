{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  options.accounts.lcleveland.settings = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "Lyle Cleveland";
      description = "Name of the user";
    };
  };
  config = lib.mkIf account.enable {
    users.users.lcleveland.description = account.name;
  };
}
