{ lib, ... }: {
  options.system.settings.boot.boot_loader = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable boot loader";
    };
  };
}
