{ config, lib, ... }:
let
  garbage_collection = config.system.settings.nix.garbage_collection;
in
{
  options.system.settings.nix.garbage_collection = {
    automatic = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Set automatic garbage collection";
    };
  };
  config = lib.mkIf (garbage_collection.automatic && garbage_collection.enable) {
    nix.gc.automatic = garbage_collection.automatic;
  };
}
