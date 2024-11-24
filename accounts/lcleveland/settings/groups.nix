{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  options.accounts.lcleveland.settings = {
    groups = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "wheel" "networkmanager" "libvirtd" ];
      description = "Groups for the user";
    };
  };
  config = lib.mkIf account.enable {
    users.users.lcleveland.extraGroups = account.groups;
  };
}
