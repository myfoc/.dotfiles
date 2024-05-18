{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland.enable = true;

  home.packages = [
    pkgs.hyprpaper
  ];

  home.file.".config/hypr" = {
    recursive = true;
    source = ./config;
    target = ".config/hypr";
  };
}
