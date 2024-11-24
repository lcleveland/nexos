{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  firacode = config.accounts.lcleveland.applications.lazygit;
in
{
  options.accounts.lcleveland.applications.firacode = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable firacode support";
    };
  };
  config = lib.mkIf (account.enable && firacode.enable) {
    home-manager.users.lcleveland.home.packages = with pkgs; [
      fira-code
      fira-code-nerdfont
      fira-code-symbols
    ];
  };
}
