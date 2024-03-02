{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = { 
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    }
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "cofymdd";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Bratislava";

  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "eurosign:e";
    displayManager.lightdm.enable = true;
    windowManager = {
      qtile.enable = true;
      gnome.enable = true;
      default = "qtile";
    };
  };

  users.users.cofymdd = {
    isNormalUser = true;
    description = "CofymDD";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kitty
    nano
    wget
    git
  ];

  system.stateVersion = "23.11";
}