{ config, lib, pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
    };
  };

  # home.file.".config/foot" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/foot";
  # };
}