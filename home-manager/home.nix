{ inputs, pkgs, systemSettings, userSettings, ... }: {
  imports = [];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/"+userSettings.username;
    stateVersion = systemSettings.version;
  };

  home.packages = with pkgs; [
    firefox
    foot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}