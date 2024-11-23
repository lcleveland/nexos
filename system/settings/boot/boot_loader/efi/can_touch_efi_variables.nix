{ config, lib, ... }:
let
  boot_loader = config.system.settings.boot.boot_loader;
in
{
  options.system.settings.boot.boot_loader.efi = {
    can_touch_efi_variables = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Allow writing to EFI variables";
    };
  };
  config = lib.mkIf boot_loader.enable {
    boot.loader = lib.mkIf boot_loader.efi.can_touch_efi_variables {
      efi.canTouchEfiVariables = boot_loader.efi.can_touch_efi_variables;
    };
  };
}
