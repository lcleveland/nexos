{ ... }: {
  imports = [
    ./email.nix
    ./enable.nix
    ./groups.nix
    ./gtk.nix
    ./initial_password.nix
    ./is_normal_user.nix
    ./name.nix
    ./plasma_manager
    ./state_version.nix
    ./use_global_packages.nix
    ./username.nix
    ./virt_manager.nix
  ];
}
