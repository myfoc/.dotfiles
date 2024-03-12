{ config, lib, pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "refined";
        plugins = [];
      };
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
    };
  };

  # home.file.".config/foot" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/foot";
  # };
}