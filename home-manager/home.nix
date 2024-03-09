{ inputs, pkgs, systemSettings, userSettings, ... }: {
  imports = [];

  home = {
    username = userSettings.username;
    homeDirectory = "/home/"+userSettings.username;
    stateVersion = systemSettings.version;
  };

  home.packages = with pkgs; [
    firefox
    foot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig  = ''
      $mainMod = SUPER
      bind = $mainMod, RETURN, exec, foot
    '';
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}