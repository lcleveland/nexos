{ config, lib, ... }:
let
  libvirt = config.system.applications.libvirt;
in
{
  config = lib.mkIf libvirt.enable {
    boot.extraModprobeConfig = "options kvm_intel nested=1";
  };
}
