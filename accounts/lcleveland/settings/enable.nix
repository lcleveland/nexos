{ lib, ... }: {
  options.accounts.lcleveland.settings = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the user";
    };
  };
}
