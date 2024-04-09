{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
  };
  programs.wofi = {
    enable = true;
  };

  home.file.".config/rofi" = {
    recursive = true;
    source = ./config;
    target = ".config/rofi";
  };
}