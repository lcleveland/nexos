{ ... }: {
  imports = [
    ./email.nix
    ./enable.nix
    ./groups.nix
    ./initial_password.nix
    ./is_normal_user.nix
    ./name.nix
    ./state_version.nix
    ./use_global_packages.nix
    ./username.nix
  ];
}
