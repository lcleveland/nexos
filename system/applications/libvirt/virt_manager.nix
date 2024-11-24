{ config, lib, ... }:
let
  libvirt = config.system.applications.libvirt;
in
{
  config = lib.mkIf libvirt.enable {
    programs.virt-manager.enable = true;
  };
}
