{ config, lib, pkgs, ... }:
let
  qemu = config.system.applications.qemu;
in
{
  options.system.applications.qemu = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable QEMU.";
    };
  };
  config = lib.mkIf qemu.enable {
    environment.systemPackages = [ pkgs.qemu ];
  };
}
