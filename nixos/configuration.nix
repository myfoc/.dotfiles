{ inputs, lib, config, pkgs, systemSettings, userSettings, ... }: {
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
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
  };

  time.timeZone = systemSettings.timezone;

  i18n.defaultLocale = systemSettings.locale;

  users.users = {
    ${userSettings.username} = {
      isNormalUser = true;
      description = userSettings.name;
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  environment.systemPackages = with pkgs; [
    nano
    git
    wget
  ];

  system.stateVersion = systemSettings.version;
}