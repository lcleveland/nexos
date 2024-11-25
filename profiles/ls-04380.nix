{ pkgs, ... }: {
  imports = [
    ./hardware_configurations/ls-04380.nix
  ];
  accounts.lcleveland.settings.enable = true;
  system.settings.boot.kernel.package = pkgs.linuxPackages_zen;
  system.settings.network.hostname = "LS-04380";
}
