{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  git = config.accounts.lcleveland.applications.git;

in
{
  options.accounts.lcleveland.applications.git = {
    credential_helper = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable git credential helper";
    };
  };
  config = lib.mkIf (account.enable && git.enable) {
    home-manager.users.lcleveland.programs.gh.gitCredentialHelper.enable = git.credential_helper;
  };
}
