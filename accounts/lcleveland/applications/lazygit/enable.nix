{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  lazygit = config.accounts.lcleveland.applications.lazygit;
in
{
  options.accounts.lcleveland.applications.lazygit = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable lazygit";
    };
  };
  config = lib.mkIf (account.enable && lazygit.enable) {
    home-manager.users.lcleveland.home.packages = pkgs.lazygit;
  };
}
