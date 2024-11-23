{ config, lib, ... }:
let
  bluetooth = config.system.settings.sound.pipewire.bluetooth;
  pipewire = config.system.settings.sound.pipewire;
in
{
  options.system.settings.sound.pipewire.bluetooth = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable bluetooth";
    };
  };
  config = lib.mkIf (pipewire.enable && bluetooth.enable) {
    services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];

      };
    };
  };
}
