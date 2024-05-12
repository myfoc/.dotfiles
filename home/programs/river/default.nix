{ config, lib, pkgs, ... }: {
	wayland.windowManager.river = {
		enable = true;
	};

	home.file.".config/river" = {
		executable = true;
    	recursive = true;
     	source = ./config;
      	target = ".config/river";
    };
}
