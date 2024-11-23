{ lib, ... }:
{
  options.system.settings.nix.garbage_collection = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Nix garbage collection";
    };
  };
}
