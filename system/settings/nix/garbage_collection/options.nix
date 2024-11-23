{ config, lib, ... }:
let
  garbage_collection = config.system.settings.nix.garbage_collection;
in
{
  options.system.settings.nix.garbage_collection = {
    options = lib.mkOption {
      type = lib.types.str;
      default = "--delete-older-than 7d";
      description = lib.mdDoc "Garbage collection options";
    };
  };
  config = lib.mkIf garbage_collection.enable {
    nix.gc.options = garbage_collection.options;
  };
}
