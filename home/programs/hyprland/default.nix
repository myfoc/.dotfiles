{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland.enable = true;

  home.packages = [
    pkgs.hyprpaper
    pkgs.hypridle
    pkgs.hyprlock
  ];

  home.file.".config/hypr" = {
    recursive = true;
    source = ./config;
    target = ".config/hypr";
  };
}
