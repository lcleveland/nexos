{ config, lib, ... }:
let
  boot_loader = config.system.settings.boot.boot_loader;
in
{
  options.system.settings.boot.boot_loader.systemd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable systemd boot loader";
    };
  };
  config = lib.mkIf boot_loader.enable {
    boot.loader = lib.mkIf boot_loader.systemd.enable {
      systemd-boot.enable = boot_loader.systemd.enable;
    };
  };
}
