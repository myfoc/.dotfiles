{ config, lib, pkgs, ... }: {
  programs.starship = {
    enable = true; 
  };

  home.file.".config/" = {
    recursive = true;
    source = ./config;
    target = ".config/";
  };
}