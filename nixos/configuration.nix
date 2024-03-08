{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  nix.nixPath = ["/etc/nix/path"];
  environment.etc = lib.mapAttrs'(name: value: { name = "nix/path/${name}"; value.source = value.flake; })config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  boot.loader = { 
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  users.users = {
    cofymdd = {
      isNormalUser = true;
      description = "CofymDD";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  system.stateVersion = "23.11";
}