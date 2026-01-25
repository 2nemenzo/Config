{ config, ... }:

{
  flake.modules.nixos.base = { pkgs, ... }: {
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Networking
    networking.hostName = config.hostName;
    networking.networkmanager.enable = true;

    # Timezone
    time.timeZone = config.timezone;

    # Auto login
    services.getty.autologinUser = config.userName;

    # User account
    users.users.${config.userName} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      packages = with pkgs; [ tree ];
    };

    # Base packages
    environment.systemPackages = with pkgs; [
      vim
      wget
      git
      gcc
      gnumake
      pavucontrol
      swayidle
    ];

    # Allow unfree
    nixpkgs.config.allowUnfree = true;

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";
  };
}
