{ config, lib, pkgs, ... }:
let
  kernel = config.system.settings.boot.kernel;
in
{
  options.system.settings.boot.kernel = {
    package = lib.mkOption {
      type = lib.types.attrs;
      default = pkgs.linuxPackages_latest;
      description = lib.mdDoc "Kernel package";
    };
  };
  config = {
    boot.kernelPackages = kernel.package;
  };
}
