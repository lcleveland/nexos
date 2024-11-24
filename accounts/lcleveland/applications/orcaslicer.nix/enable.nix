{ config, lib, pkgs, ... }:
let
  account = config.accounts.lcleveland.settings;
  orcaslicer = config.accounts.lcleveland.applications.orcaslicer;
in
{
  options.accounts.lcleveland.applications.orcaslicer = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable orca-slicer";
    };
  };
  config = lib.mkIf (account.enable && orcaslicer.enable) {
    environment.systemPackages = with pkgs; [ orca-slicer ];
  };
}
