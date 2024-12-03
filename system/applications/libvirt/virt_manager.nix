{ config, lib, pkgs, ... }:
let
  libvirt = config.system.applications.libvirt;
in
{
  config = lib.mkIf libvirt.enable {
    programs.virt-manager.enable = true;
    environment.systemPackages = with pkgs; [
      (virt-manager.overrideAttrs (old: {
        nativeBuildInputs = old.nativeBuildInputs ++ [ wrapGAppsHook ];
        buildInputs = lib.lists.subtractLists [ wrapGAppsHook ] old.buildInputs ++ [
          gst_all_1.gst-plugins-base
          gst_all_1.gst-plugins-good
        ];
      }))
    ];
  };
}
