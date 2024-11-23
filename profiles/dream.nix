{ pkgs, ... }: {
  imports = [
    ./hardware_configurations/dream.nix
  ];
  accounts.lcleveland.settings.enable = true;
  system.settings.graphics.enable = true;
  system.settings.boot.kernel.package = pkgs.linuxPackages_xanmod;
}
