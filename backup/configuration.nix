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

  i18n.defaultLocale = "en_US.UTF-8";

  services = {    
    xserver = {
      enable = true;
      layout = "us";
      displayManager = {
        autoLogin = {
          enable = true;
          user = "cofymdd";
        };
      };
    };
    
    xserver = {
      enable = true;
      layout = "us";
      windowManager.sway.enable = true;
      displayManager = {
        autoLogin = {
          enable = true;
          user = "cofymdd";
        };
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  users.users.cofymdd = {
    isNormalUser = true;
    description = "CofymDD";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ neofetch ];
  };

  environment.systemPackages = with pkgs; [
    foot
    sway
    firefox
    nano
    wget
    git
  ];

  system.stateVersion = "23.11";
}