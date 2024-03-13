{ config, pkgs, ... }: {
  programs.rofi-wayland = {
    enable = true;
  };

  home.file.".config/rofi" = {
    recursive = true;
    source = ./config;
    target = ".config/rofi";
  };
}