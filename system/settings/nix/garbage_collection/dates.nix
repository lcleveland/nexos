{ config, lib, ... }:
let
  garbage_collection = config.system.settings.nix.garbage_collection;
in
{
  options.system.settings.nix.garbage_collection = {
    dates = lib.mkOption {
      type = lib.types.str;
      default = "weekly";
      description = lib.mdDoc "Garbage collection frequency";
    };
  };
  config = lib.mkIf (garbage_collection.automatic && garbage_collection.enable) {
    nix.gc.dates = garbage_collection.dates;
  };
}
