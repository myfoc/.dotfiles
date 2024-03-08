{ inputs, lib, config, pkgs, systemSettings, userSettings, ... }: {
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  nixpkgs.hostPlatform = systemSettings.system;
}
