{ systemSettings, ... }: {
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  nixpkgs.hostPlatform = systemSettings.system;
}
