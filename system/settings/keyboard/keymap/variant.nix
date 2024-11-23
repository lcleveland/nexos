{ config, lib, ... }:
let
  keymap = config.system.settings.keyboard.keymap;
in
{
  options.system.settings.keyboard.keymap = {
    variant = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = lib.mdDoc "Keyboard variant";
    };
  };
  config = {
    services.xserver.xkb.variant = keymap.variant;
  };
}
