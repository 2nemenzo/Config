{ ... }:

{
  flake.modules.nixos.laptop = { lib, ... }: {
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 80;

        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";

        USB_AUTOSUSPEND = 1;
      };
    };

    services.power-profiles-daemon.enable = false;
    services.thermald.enable = true;
    services.system76-scheduler.enable = lib.mkDefault false;

    services.logind = {
      lidSwitch = "suspend";
      lidSwitchExternalPower = "lock";
      powerKey = "suspend";
    };

    services.fwupd.enable = true;
  };
}
