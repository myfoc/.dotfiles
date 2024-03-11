{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig  = ''
# Dotfiles by CofymDD
    '';
  };

  home.file.".config/hypr" = {
    recursive = true;
    source = ./config;
    target = ".config/hypr";
  };
}