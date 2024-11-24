{ ... }: {
  imports = [
    ./browser_integration.nix
    ./disable_wayland.nix
    ./enable.nix
  ];
}
