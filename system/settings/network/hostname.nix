{ config, lib, ... }:
let
  network = config.system.settings.network;
in
{
  options.system.settings.network = {
    hostname = lib.mkOption {
      type = lib.types.str;
      default = "nexos";
      description = lib.mdDoc "Hostname";
    };
  };
  config = {
    networking.hostName = network.hostname;
  };
}
