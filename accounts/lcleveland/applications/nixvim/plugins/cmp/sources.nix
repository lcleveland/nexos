{ username, plugin_name }:
{ config, lib, ... }:
let
  account = config.accounts.${username}.settings;
  nixvim = config.accounts.${username}.applications.nixvim;
in
{
  options.accounts.${username}.applications.nixvim.plugins.${plugin_name} = {
    sources = lib.mkOption {
      type = lib.types.listOf lib.types.attrs;
      default = [
        { name = "codeium"; }
      ];
      description = lib.mdDoc "Sources for cmp plugin";
    };
  };
  config = lib.mkIf (account.enable && nixvim.enable) {
    home-manager.users.${username}.programs.nixvim.plugins.${plugin_name}.settings.sources = nixvim.plugins.${plugin_name}.sources;
  };
}
