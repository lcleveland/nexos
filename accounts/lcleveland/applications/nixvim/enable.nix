{ config, inputs, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  nixvim = config.accounts.lcleveland.applications.nixvim;
in
{
  options.accounts.lcleveland.applications.nixvim = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable NixVim";
    };
  };
  config = lib.mkIf (account.enable && nixvim.enable) {
    home-manager.users.lcleveland = {
      imports = [
        inputs.nixvim.homeManagerModules.nixvim
      ];
    };
  };
}
