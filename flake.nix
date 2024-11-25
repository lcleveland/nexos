{
  description = "NexOS";

  outputs = { home_manager_stable, nixos_hardware, nixpkgs_stable, nixpkgs_unstable, nixvim, plasma_manager, self }@inputs:
    let
      base_modules = [
        ./accounts
        home_manager_stable.nixosModules.home-manager
        ./system
      ];
      make_system = profile:
        nixpkgs_stable.lib.nixosSystem {
          modules = base_modules ++ [ profile ];
          specialArgs = {
            inherit inputs;
          };
        };
      make_framework_16_system = profile:
        nixpkgs_stable.lib.nixosSystem {
          modules = base_modules ++ [ profile ] ++ nixos_hardware.nixosModules.framework-16-amd-7040;
          specialArgs = {
            inherit inputs;
          };
        };
    in
    {
      nixosConfigurations = {
        DREAM = make_system ./profiles/dream.nix;
        LS-04380 = make_framework_16_system ./profiles/ls-04380.nix;
      };
    };
  inputs = {
    home_manager_stable = {
      inputs.nixpkgs.follows = "nixpkgs_stable";
      url = "github:nix-community/home-manager?ref=release-24.11";
    };
    nixos_hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    nixpkgs_stable = {
      url = "github:nixos/nixpkgs?ref=nixos-24.11";
    };
    nixpkgs_unstable = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs_stable";
    };
    plasma_manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs_stable";
      inputs.home-manager.follows = "home_manager_stable";
    };
  };
}
