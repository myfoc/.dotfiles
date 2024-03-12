{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true; 
  };

  # home.file.".config/foot" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/foot";
  # };
}