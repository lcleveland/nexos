{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  quickemu = config.accounts.lcleveland.applications.lazygit;
in
{
  options.accounts.lcleveland.applications.quickemu = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable quickemu support";
    };
  };
  config = lib.mkIf (account.enable && quickemu.enable) {
    environment.systemPackages = [
      pkgs.quickemu
    ];
  };
}
