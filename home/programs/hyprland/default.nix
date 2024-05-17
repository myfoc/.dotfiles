{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig  = '' '';
  };

  home.file.".config/hypr" = {
    recursive = true;
    source = ./config;
    target = ".config/hypr";
  };
}
