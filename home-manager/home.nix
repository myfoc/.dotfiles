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
    alacritty
    wofi
    waybar
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
      menu = "wofi --show run";
      bars = [{
        fonts.size = 15.0;
        position = "bottom";
      }];
      output = {
        eDP-1 = {
          scale = "1";
	      };
	    };
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}