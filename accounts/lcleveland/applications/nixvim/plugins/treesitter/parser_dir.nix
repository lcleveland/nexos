{ username, plugin_name }:
{ config, lib, ... }:
let
  account = config.accounts.${username}.settings;
  nixvim = config.accounts.${username}.applications.nixvim;
in
{
  options.accounts.${username}.applications.nixvim.plugins.${plugin_name} = {
    parser_dir = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Parser install directory";
    };
  };
  config = lib.mkIf (account.enable && nixvim.enable) {
    home-manager.users.${username}.programs.nixvim.plugins.${plugin_name}.settings.parser_install_dir = nixvim.plugins.${plugin_name}.parser_dir;
  };
}
