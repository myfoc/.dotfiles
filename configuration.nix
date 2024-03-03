{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ];

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

  i18n.defaultLocale = "ru_RU.UTF-8";

  services = {    
    xserver = {
      enable = true;
      layout = "us";
      windowManager.dwm.enable = true;
      displayManager = {
        sddm.enable = true;
        defaultSession = "none+dwm";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  users.users.cofymdd = {
    isNormalUser = true;
    description = "CofymDD";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    firefox
    dmenu
    nano
    wget
    git
    dwm
    st
  ];

  system.stateVersion = "23.11";
}