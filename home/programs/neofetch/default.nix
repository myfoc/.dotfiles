{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    neofetch
  ];

  home.file.".config/neofetch" = {
    recursive = true;
    source = ./config;
    target = ".config/neofetch";
  };
}