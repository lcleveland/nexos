{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  options.accounts.lcleveland.settings = {
    is_normal_user = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Is the user a normal user? (true for normal users, false for system users)";
    };
  };
  config = lib.mkIf account.enable {
    users.users.lcleveland.isNormalUser = account.is_normal_user;
    users.users.lcleveland.isSystemUser = !account.is_normal_user;
  };
}
