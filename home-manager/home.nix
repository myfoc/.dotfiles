{ inputs, pkgs, systemSettings, userSettings, ... }: {
  imports = [];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/"+userSettings.username;
    stateVersion = systemSettings.version;
  };

  home.packages = with pkgs; [
    swayidle
    wl-clipboard
    mako
    foot
    wofi
    waybar
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "foot";
      menu = "wofi --show run";
      bars = [{
        fonts.size = 15.0;
        position = "top";
      }];
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}