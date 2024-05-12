{ config, lib, pkgs, ... }: {

  wayland.windowManager.river = {
    enable = true;
  };

  home.file.".config/river/init.sh" = {
    source = ./config/init.sh;
    target = ".config/river/init.sh";
    executable = true;
  };
}
