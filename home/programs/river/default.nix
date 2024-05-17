{ config, lib, pkgs, ... }: {
  services.river = {
    enable = true;
    extraConfig = ''
      riverctl map normal Super Return spawn foot
      riverctl map normal Super Q close
      riverctl map normal Super+Shift E exit
    '';
  };
}
