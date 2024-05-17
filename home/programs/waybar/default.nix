{ config, lib, pkgs, ... }: {
  programs.waybar.enable = true;

  home.file.".config/waybar" = {
    recursive = true;
    source = ./config;
    target = ".config/waybar";
  };
}
