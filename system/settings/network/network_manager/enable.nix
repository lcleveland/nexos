{ config, lib, ... }:
let
  network_manager = config.system.settings.network.network_manager;
in
{
  options.system.settings.network.network_manager = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable network manager";
    };
  };
  config = lib.mkIf network_manager.enable {
    networking.networkmanager.enable = network_manager.enable;
  };
}
