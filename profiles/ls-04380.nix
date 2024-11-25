{ pkgs, ... }: {
  imports = [
    ./hardware_configurations/dream.nix
  ];
  accounts.lcleveland.settings.enable = true;
  system.settings.boot.kernel.package = pkgs.linuxPackages_zen;
  system.settings.network.hostname = "LS-04380";
}
