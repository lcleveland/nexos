{ pkgs, ... }: {
  imports = [
    ./hardware_configurations/dream.nix
  ];
  accounts.lcleveland.settings.enable = true;
  system.settings.graphics.enable = true;
}
