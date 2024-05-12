{ config, lib, pkgs, ... }: {
	wayland.windowManager.river = {
		enable = true;
	};

	home.file.".config/river" = {
    	source = ./config/init;
   		target = ".config/river/init";
		executable = true;
    };
}
