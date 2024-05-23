{ config, lib, pkgs, ... }: {
  home.packages = [
    pkgs.networkmanagerapplet
    pkgs.font-awesome
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
