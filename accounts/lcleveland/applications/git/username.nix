{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  git = config.accounts.lcleveland.applications.git;
in
{
  options.accounts.lcleveland.applications.git = {
    username = lib.mkOption {
      type = lib.types.str;
      default = account.username;
      description = lib.mdDoc "Git username";
    };
  };
  config = lib.mkIf (git.enable && account.enable) {
    home-manager.users.lcleveland.programs.git.userName = git.username;
  };
}
