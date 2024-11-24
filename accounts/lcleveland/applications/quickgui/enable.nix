{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  quickgui = config.accounts.lcleveland.applications.lazygit;
in
{
  options.accounts.lcleveland.applications.quickgui = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable quickgui support";
    };
  };
  config = lib.mkIf (account.enable && quickgui.enable) {
    environment.systemPackages = [
      pkgs.quickgui
    ];
  };
}
