{ config, lib, pkgs, ... }: {
	wayland.windowManager.river = {
		enable = true;
	};

	home.file.".config/river/init" = {
    	source = ./config/init;
   		target = ".config/river/init";
		executable = true;
    };
}
