{ inputs, pkgs, systemSettings, userSettings, ... }: {
  imports = [];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/"+userSettings.username;
    stateVersion = systemSettings.version;
  };

  home.packages = with pkgs; [
    firefox
    kitty
    foot
  ];

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   settings = {
  #     decoration = {
  #     shadow_offset = "0 5";
  #     "col.shadow" = "rgba(00000099)";
  #     };

  #     "$mod" = "SUPER";

  #     bindm = [
  #       "$mod, mouse:272, movewindow"
  #       "$mod, mouse:273, resizewindow"
  #       "$mod ALT, mouse:272, resizewindow"
  #     ];
  #   };
  # };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}