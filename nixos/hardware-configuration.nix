{ inputs, systemSettings, ... }: {
  nixpkgs.hostPlatform = systemSettings.system;
}