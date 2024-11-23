{ config, lib, ... }:
let
  nix = config.system.settings.nix;
in
{
  options.system.settings.nix = {
    state_version = lib.mkOption {
      type = lib.types.str;
      default = "24.05";
      description = lib.mdDoc "Nix state version";
    };
  };
  config = {
    system.stateVersion = nix.state_version;
  };
}
