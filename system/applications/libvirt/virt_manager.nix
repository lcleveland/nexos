{ config, lib, ... }:
let
  libvirt = config.system.applications.libvirt;
in
{
  config = lib.mkIf libvirt.enable {
    programs.virt-manager.enable = true;
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
