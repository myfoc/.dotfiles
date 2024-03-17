{ config, lib, pkgs, ... }: {
  programs.gpg = {
    enable = true; 
  };

  home.packages = with pkgs; [
    pinentry
    pass
  ];

  # home.file.".config/foot" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/foot";
  # };
}