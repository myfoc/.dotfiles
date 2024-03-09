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

  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    extraOptions = [ "-vga qxl" ];
    config = rec {
      modifier = "Mod4";
      terminal = "foot"; 
    };
    systemd.enable = true;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}