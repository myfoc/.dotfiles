{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = { 
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
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

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    
    xserver = {
      enable = true;
      layout = "us";
      desktopManager.gnome.enable = true;
      windowManager.qtile.enable = true;
      displayManager = {
        gdm.enable = true;
        defaultSession = "none+qtile";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  users.users.cofymdd = {
    isNormalUser = true;
    description = "CofymDD";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  environment.systemPackages = with pkgs; [
    st
    nano
    wget
    git
  ];

  system.stateVersion = "23.11";
}