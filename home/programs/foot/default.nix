{ config, lib, pkgs, ... }: {
  programs.foot = {
    enable = true; 
    server = {
      enable = true;
    };
    settings = {
      main = {
        font = "Iosevka Nerd Font:Medium:size=13";
        font-bold = "Iosevka Nerd Font:Bold:size=13";
        font-italic = "Iosevka Nerd Font:Italic:size=13";
        font-bold-italic="Iosevka Nerd Font:Bold Italic:size=13";
        pad="12x12";
      };
      
      bell = {
        urgent = "yes";
        notify = "yes";
      };
        
      colors = {
        alpha="0.95";
        background="0x141b1e";
        foreground="0xdadada";

        regular0="0x232a2d";
        regular1="0xe57474";
        regular2="0x8ccf7e";
        regular3="0xe5c76b";
        regular4="0x67b0e8";
        regular5="0xc47fd5";
        regular6="0x6cbfbf";
        regular7="0xb3b9b8";

        bright0="0x2d3437";
        bright1="0xef7e7e";
        bright2="0x96d988";
        bright3="0xf4d67a";
        bright4="0x71baf2";
        bright5="0xce89df";
        bright6="0x67cbe7";
        bright7="0xbdc3c2";
      };
    };
  };

  # home.file.".config/hypr" = {
  #   recursive = true;
  #   source = ./config;
  #   target = ".config/hypr";
  # };
}