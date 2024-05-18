{ config, pkgs, ... }: {
  home.file."wallpapers" = {
    recursive = true;
    source = ./images;
    target = "wallpapers";
  };
}
