{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.homemachine = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/homemachine/configuration.nix
        ./modules/nixos
      ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/thinkpad/configuration.nix
        ./modules/nixos
      ];
    };
  };
}
