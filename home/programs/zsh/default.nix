{ config, lib, pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;

  # home.file.".config/foot" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/foot";
  # };
}