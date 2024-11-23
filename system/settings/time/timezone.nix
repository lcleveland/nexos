{ config, lib, ... }:
let
  time = config.system.settings.time;
in
{
  options.system.settings.time = {
    timezone = lib.mkOption {
      type = lib.types.str;
      default = "America/Chicago";
      description = lib.mdDoc "Timezone";
    };
  };
  config = {
    time.timeZone = time.timezone;
  };
}
