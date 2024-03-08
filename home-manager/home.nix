{ inputs, lib, config, pkgs, ...}: {
  imports = [];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };

  home.packages = with pkgs; [ nano ];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";
}