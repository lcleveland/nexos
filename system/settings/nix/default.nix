{ ... }: {
  imports = [
    ./allow_unfree_software.nix
    ./flake
    ./host_platform.nix
    ./garbage_collection
    ./state_version.nix
    ./store_optimization.nix
  ];
}
