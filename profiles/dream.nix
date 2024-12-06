{ config, pkgs, ... }: {
  imports = [
    ./hardware_configurations/dream.nix
  ];
  accounts.lcleveland.settings.enable = true;
  system.settings.graphics.enable = true;
  system.settings.boot.kernel.package = pkgs.linuxPackages_xanmod;
  system.settings.network.hostname = "DREAM";
  accounts.lcleveland.applications.orcaslicer.enable = false;
  system.settings.graphics.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
