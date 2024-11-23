{ lib, ... }: {
  options.system.settings.graphics = {
    enabled_graphics = lib.mkOption {
      type = lib.types.enum [
        "nvidia"
      ];
      default = "nvidia";
      description = lib.mdDoc "The graphics card to use";
    };
  };
}
