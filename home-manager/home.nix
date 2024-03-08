{ inputs, pkgs, systemSettings, userSettings, ... }: {
  imports = [];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/"+userSettings.username;
    stateVersion = systemSettings.version;
  };

  home.packages = with pkgs; [ nano ];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";
}