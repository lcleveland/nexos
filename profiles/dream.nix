{ pkgs, ... }: {
  imports = [
    ./hardware_configurations/dream.nix
  ];
  accounts.lcleveland.settings.enable = true;
  system.settings.graphics.enable = true;
  system.settings.boot.kernel.package = pkgs.linuxPackages_zen;
  system.settings.network.hostname = "DREAM";
  accounts.lcleveland.applications.orcaslicer.enable = false;
}
