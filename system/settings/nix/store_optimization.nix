{ config, lib, ... }:
let
  nix = config.system.settings.nix;
in
{
  options.system.settings.nix = {
    store_optimization = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Set Nix store optimization";
    };
  };
  config = lib.mkIf nix.store_optimization {
    nix.settings.auto-optimise-store = nix.store_optimization;
  };
}
