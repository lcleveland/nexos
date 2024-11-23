{ config, lib, ... }:
let
  accounts = config.accounts.settings;
in
{
  options.accounts.settings = {
    mutable_users = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Use mutable users";
    };
  };
  config = {
    users.mutableUsers = accounts.mutable_users;
  };
}
