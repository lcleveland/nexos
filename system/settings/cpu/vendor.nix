{ lib, ... }: {

  options.system.settings.cpu = {
    vendor = lib.mkOption {
      type = lib.types.enum [
        "amd"
        "intel"
      ];
      default = "amd";
      description = lib.mdDoc "CPU vendor";
    };
  };
}
