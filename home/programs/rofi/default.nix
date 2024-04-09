{ config, pkgs, ... }: {
  home.file.".config/rofi" = {
    recursive = true;
    source = ./config;
    target = ".config/rofi";
  };
}