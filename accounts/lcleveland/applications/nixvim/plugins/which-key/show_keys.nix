{ username, plugin_name }:
{ config, lib, ... }:
let
  account = config.accounts.${username}.settings;
  nixvim = config.accounts.${username}.applications.nixvim;
in
{
  options.accounts.${username}.applications.nixvim.plugins.${plugin_name} = {
    show_keys = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Show keys in which-key";
    };
  };
  config = lib.mkIf (account.enable && nixvim.enable) {
    home-manager.users.${username}.programs.nixvim.plugins.${plugin_name}.settings.show_keys = nixvim.plugins.${plugin_name}.show_keys;
  };
}
