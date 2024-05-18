{ inputs, config, pkgs, systemSettings, userSettings, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot = {
    kernelParams = [ "video=virtio" ];
    loader.systemd-boot.enable = true;
    loader.systemd-boot.configurationLimit = 3;
    loader.efi.canTouchEfiVariables = true;
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
  };

  time.timeZone = systemSettings.timezone;
  i18n.defaultLocale = systemSettings.locale;

  hardware.opengl.enable = true;
  hardware.videoDrivers = [ "virtio" ];

  sound.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment = {
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [ nano wget git ];
  };

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = systemSettings.version;
}