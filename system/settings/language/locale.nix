{ config, lib, ... }:
let
  language = config.system.settings.language;
in
{
  options.system.settings.language = {
    locale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = lib.mdDoc "System locale";
    };
  };
  config = {
    i18n = {
      defaultLocale = language.locale;
      extraLocaleSettings = {
        LC_ADDRESS = language.locale;
        LC_IDENTIFICATION = language.locale;
        LC_MEASUREMENT = language.locale;
        LC_MONETARY = language.locale;
        LC_NAME = language.locale;
        LC_NUMERIC = language.locale;
        LC_PAPER = language.locale;
        LC_TELEPHONE = language.locale;
        LC_TIME = language.locale;
      };
    };
  };
}
