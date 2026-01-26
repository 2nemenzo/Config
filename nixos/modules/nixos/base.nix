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

    # Power button behavior - let Hyprland handle it via XF86PowerOff keybind
    # Setting to "ignore" allows the key event to pass through to the compositor
    services.logind.settings.Login = {
      HandlePowerKey = "ignore";
      HandlePowerKeyLongPress = "poweroff";
    };

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
    ];

    # Allow unfree
    nixpkgs.config.allowUnfree = true;

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";
  };
}
