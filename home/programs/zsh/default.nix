{ config, lib, pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
    };
  };

  home.file.".config/" = {
    recursive = true;
    source = ./config;
    target = ".config/";
  };
}