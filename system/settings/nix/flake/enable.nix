{ config, lib, ... }:
let
  flake = config.system.settings.nix.flake;
in
{
  options.system.settings.nix.flake = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Nix flake support";
    };
  };
  config = lib.mkIf flake.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
