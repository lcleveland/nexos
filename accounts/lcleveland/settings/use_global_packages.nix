{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
in
{
  options.accounts.lcleveland.settings = {
    use_global_packages = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Use global packages for home manager";
    };
  };
  config = lib.mkIf (account.enable && account.use_global_packages) {
    home-manager.useGlobalPkgs = account.use_global_packages;
  };
}
