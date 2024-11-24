{ config, inputs, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  plasma_manager = config.accounts.lcleveland.settings.plasma_manager;
in
{
  options.accounts.lcleveland.settings.plasma_manager = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Plasma Manager";
    };
  };
  config = lib.mkIf (account.enable && plasma_manager.enable) {
    home-manager.users.lcleveland = {
      imports = [
        inputs.plasma_manager.homeManagerModules.plasma-manager
      ];
      programs.plasma.enable = plasma_manager.enable;
    };
  };
}
