{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    systemSettings = {
      system = "aarch64-linux";
      hostname = "cofymdd";
      timezone = "Europe/Bratislava";
      locale = "en_US.UTF-8";
      version = "23.11";
    };

    userSettings = {
      username = "cofymdd";
      name = "CofymDD";
      dotfilesDir = "~/.dotfiles";
    };
    
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
  in {
    nixosConfigurations.${systemSettings.hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = { 
        inherit systemSettings;
        inherit userSettings;
      };
      modules = [ 
        ./nixos/configuration.nix 
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.userSettings.user = import ./home-manager/home.nix;
          home-manager.extraSpecialArgs = { 
            inherit systemSettings;
            inherit userSettings;
          };
        }
      ];
    };
  };
}