{ config, lib, pkgs, ... }: {
  programs.zsh = {
    enable = true; 
  };

  home.file."/" = {
    recursive = true;
    source = ./config;
    target = "/";
  };
}