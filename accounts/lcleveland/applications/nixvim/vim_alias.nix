{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  nixvim = config.accounts.lcleveland.applications.nixvim;
in
{
  options.accounts.lcleveland.applications.nixvim = {
    vim_alias = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Create a vim alias";
    };
  };
  config = lib.mkIf (account.enable && nixvim.enable) {
    home-manager.users.lcleveland.programs.nixvim.vimAlias = nixvim.vim_alias;
  };
}
