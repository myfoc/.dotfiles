{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
  };
  home.packages = with pkgs; [
    tofi
  ];

  home.file.".config/rofi" = {
    recursive = true;
    source = ./config;
    target = ".config/rofi";
  };
}