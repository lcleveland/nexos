{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  libvirt = config.system.applications.libvirt;
in
{
  config = lib.mkIf (account.enable && libvirt.enable) {
    home-manager.users.lcleveland.dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
