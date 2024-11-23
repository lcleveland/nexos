{ config, lib, ... }:
let
  nix = config.system.settings.nix;
in
{
  options.system.settings.nix = {
    allow_unfree_software = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Allow unfree software";
    };
  };
  config = lib.mkIf nix.allow_unfree_software {
    nixpkgs.config.allowUnfree = nix.allow_unfree_software;
  };
}
