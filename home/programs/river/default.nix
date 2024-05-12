{ config, lib, pkgs, ... }: {
	wayland.windowManager.river = {
		enable = true;
	};

	home.file.".config/river" = {
    	recursive = true;
     	source = ./config;
      	target = ".config/river";
       	postBuild = ''
        	chmod +x $out/.config/river/init.sh
        '';
    };
}
