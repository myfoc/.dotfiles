{ inputs, pkgs, systemSettings, userSettings, ... }: {
  imports = [
    ./programs
  ];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/"+userSettings.username;
    stateVersion = systemSettings.version;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
