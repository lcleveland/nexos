{ lib, ... }: {
  options.system.settings.graphics = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc "Enable use of discrete graphics card";
    };
  };
}
