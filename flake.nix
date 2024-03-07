{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
  let
    system = "aarch64-linux";
    pkgs = nixpkgs.legacyPackages.${system};ß
    inherit (self) outputs;
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs outputs;};
      modules = [ 
        ./nixos/configuration.nix
      ];
    };
  };
}