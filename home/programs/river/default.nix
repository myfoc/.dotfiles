{ config, lib, pkgs, ... }: {
  wayland.windowManager.river = {
    enable = true;
  };

  home.file.".config/river/init.sh" = {
    source = ./config/init.sh;
    executable = true;
  };
}
