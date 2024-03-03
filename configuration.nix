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
      screenSection = ''Option "DPI" "192 x 192"'';
      dpi = 120;
      layout = "us";
      windowManager.qtile = {
        enable = true;
        backend = "wayland";
      };
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
        defaultSession = "none+qtile";
      };
      libinput.enable = true;
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
    qtile
    foot
    nano
    wget
    git
  ];

  system.stateVersion = "23.11";
}