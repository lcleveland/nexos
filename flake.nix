{
  description = "A very basic flake";

  outputs = { home_manager_stable, nixpkgs_stable, nixpkgs_unstable, nixvim, plasma_manager, self }@inputs:
    let
      base_modules = [
        home_manager_stable.nixosModules.home-manager
        ./system
        ./accounts
      ];
      make_system = profile:
        nixpkgs_stable.lib.nixosSystem {
          modules = base_modules ++ [ profile ];
          specialArgs = {
            inherit inputs;
          };
        };
    in
    {
      nixosConfigurations = {
        DREAM = make_system ./profiles/dream.nix;
      };
    };
  inputs = {
    home_manager_stable = {
      inputs.nixpkgs.follows = "nixpkgs_stable";
      url = "github:nix-community/home-manager?ref=release-24.11";
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
