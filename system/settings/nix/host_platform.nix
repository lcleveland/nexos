{ config, lib, ... }:
let
  nix = config.system.settings.nix;
in
{
  options.system.settings.nix = {
    host_platform = lib.mkOption {
      type = lib.types.str;
      default = "x86_64-linux";
      description = lib.mdDoc "Host platform";
    };
  };
  config = {
    nixpkgs.hostPlatform = nix.host_platform;
  };
}
