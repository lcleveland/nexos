{ config, lib, ... }:
let
  account = config.accounts.lcleveland;
  git = config.accounts.lcleveland.applications.git;
in
{
  options.accounts.lcleveland.applications.git = {
    email = lib.mkOption {
      type = lib.types.str;
      default = "lyle.cleveland@proton.me";
      description = lib.mdDoc "Git email";
    };
  };
  config = lib.mkIf (git.enable && account.enable) {
    home-manager.users.lcleveland.programs.git.userEmail = git.email;
  };
}
