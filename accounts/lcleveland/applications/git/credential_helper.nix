{ config, lib, ... }:
let
  account = config.accounts.lcleveland.settings;
  git = config.accounts.lcleveland.applications.git;

in
{
  options.accounts.lcleveland.applications.git = {
    credential_helper = lib.mkOption {
      type = lib.types.enum [
        "oauth"
      ];
      default = "oauth";
      description = "The git credential helper to use.";
    };
  };
  config = lib.mkIf (account.enable && git.enable) {
    programs.git.config = {
      credential.helper = "oauth";
    };
  };
}
