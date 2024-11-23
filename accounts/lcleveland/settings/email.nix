{ lib, ... }: {
  options.accounts.lcleveland.settings = {
    email = lib.mkOption {
      type = lib.types.str;
      default = "lyle.cleveland@proton.me";
      description = "Email address for lcleveland";
    };
  };
}
