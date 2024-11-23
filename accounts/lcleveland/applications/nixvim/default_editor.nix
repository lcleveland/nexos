{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  nixvim = config.accounts.lcleveland.applications.nixvim;
in
{
  options.accounts.lcleveland.applications.nixvim = {
    default_editor = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Set default editor to NixVim";
    };
  };
  config = lib.mkIf (account.enable && nixvim.enable) {
    home-manager.users.lcleveland.programs.nixvim.defaultEditor = nixvim.default_editor;
  };
}
