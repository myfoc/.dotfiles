{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true; 
  };

  home.file.".config/fish" = {
    recursive = true;
    source = ./config;
    target = ".config/fish";
  };
}