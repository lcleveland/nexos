{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  git = config.accounts.lcleveland.applications.git;
in
{
  options.accounts.lcleveland.applications.git = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable git";
    };
  };
  config = lib.mkIf (git.enable && account.enable) {
    home-manager.users.lcleveland.programs.git.enable = git.enable;
  };
}
