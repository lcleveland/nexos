{ username, plugin_name }:
{ config, lib, ... }:
let
  account = config.accounts.${username}.settings;
  nixvim = config.accounts.${username}.applications.nixvim;
in
{
  config = lib.mkIf (account.enable && nixvim.enable) {
    home-manager.users.${username}.programs.nixvim.plugins.${plugin_name}.servers.nil_ls = {
      enable = true;
      autostart = true;
    };
  };
}
