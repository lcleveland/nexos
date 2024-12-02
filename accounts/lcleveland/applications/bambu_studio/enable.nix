{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  bambu_studio = config.accounts.lcleveland.applications.bambu_studio;
in
{
  options.accounts.lcleveland.applications.bambu_studio = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable bambu studio";
    };
  };
  config = lib.mkIf (account.enable && bambu_studio.enable) {
    home-manager.users.lcleveland.home.packages = with pkgs; [ bambu-studio ];
  };
}
