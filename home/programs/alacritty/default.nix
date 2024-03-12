{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true; 
  };

  # home.file.".config/alacritty" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/alacritty";
  # };
}