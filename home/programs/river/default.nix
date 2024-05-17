{ config, lib, pkgs, ... }: {
  wayland.windowManager.river = {
    enable = true;
    extraConfig  = ''
      # Dotfiles by CofymDD
    '';
  };

  home.file.".config/river" = {
    recursive = true;
    source = ./config;
    target = ".config/river";
  };
}
