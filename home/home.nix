{ inputs, pkgs, systemSettings, userSettings, ... }: {
  imports = [
    ./programs
    ./wallpapers
  ];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/"+userSettings.username;
    stateVersion = systemSettings.version;
  };

  home.packages = with pkgs; [
    nerdfonts
    firefox
  ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}