{ config, lib, ... }:
let
  keymap = config.system.settings.keyboard.keymap;
in
{
  options.system.settings.keyboard.keymap = {
    layout = lib.mkOption {
      type = lib.types.str;
      default = "us";
      description = lib.mdDoc "Keyboard layout";
    };
  };
  config = {
    services.xserver.xkb.layout = keymap.layout;
  };
}
