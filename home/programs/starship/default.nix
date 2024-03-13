{ config, lib, pkgs, ... }: {
  programs.starship = {
    enable = true; 
    settings = {
      add_newline = false;
    };
  };

  # home.file.".config/" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/";
  # };
}