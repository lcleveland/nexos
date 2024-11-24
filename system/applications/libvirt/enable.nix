{ config, lib, pkgs, ... }:
let
  libvirt = config.system.applications.libvirt;
in
{
  options.system.applications.libvirt = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable QEMU.";
    };
  };
  config = lib.mkIf libvirt.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
  };
}
