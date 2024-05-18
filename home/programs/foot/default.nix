{ config, lib, pkgs, ... }: {
  programs.foot = {
  	enable = true;
    server.enable = true;
  };

  home.file.".config/foot" = {
    recursive = true;
    source = ./config;
    target = ".config/foot";
  };
}
