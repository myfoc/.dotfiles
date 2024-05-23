{ config, lib, pkgs, ... }: {
  services.network-manager-applet.enable;

  home.packages = [
    pkgs.font-awesome
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
