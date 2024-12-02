{ pkgs, ... }: {
  imports = [
    ./hardware_configurations/ls-04380.nix
  ];
  accounts.lcleveland.settings.enable = true;
  system.settings.boot.kernel.package = pkgs.linuxPackages_zen;
  system.settings.network.hostname = "LS-04380";
  system.settings.framework.enable = true;
  system.settings.keyboard.keymap.variant = "colemak_dh";
  system.settings.desktop_environment.enabled_environment = "gnome";
  accounts.lcleveland.applications.orcaslicer.enable = false;
}
