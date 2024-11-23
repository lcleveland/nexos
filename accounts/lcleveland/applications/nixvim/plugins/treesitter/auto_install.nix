{ username, plugin_name }:
{ config, lib, ... }:
let
  account = config.accounts.${username}.settings;
  nixvim = config.accounts.${username}.applications.nixvim;
in
{
  options.accounts.${username}.applications.nixvim.plugins.${plugin_name} = {
    auto_install = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Auto install treesitter parsers";
    };
  };
  config = lib.mkIf (account.enable && nixvim.enable) {
    home-manager.users.${username}.programs.nixvim.plugins.${plugin_name}.settings.auto_install = nixvim.plugins.${plugin_name}.auto_install;
  };
}
