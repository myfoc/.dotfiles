{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true; 
    window.dimensions = {
      lines = 3;
      columns = 200;
    };
  };

  # home.file.".config/alacritty" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/alacritty";
  # };
}