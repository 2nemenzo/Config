{ ... }:

{
  flake.modules.homeManager.hyprlock = { config, pkgs, ... }:
  let
    colors = config.theme.colors;
  in
  {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          hide_cursor = true;
          grace = 0;
        };

        # Solid dark background like tuigreet
        background = [{
          path = "";
          color = "rgb(${colors.background})";
        }];

        input-field = [{
          size = "300, 30";
          outline_thickness = 0;
          dots_size = 0.2;
          dots_spacing = 0.3;
          dots_center = true;
          outer_color = "rgb(${colors.background})";
          inner_color = "rgb(${colors.background})";
          font_color = "rgb(${colors.foreground})";
          fade_on_empty = false;
          placeholder_text = "Password:";
          hide_input = false;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }];

        label = [
          # Simple time display like tuigreet
          {
            text = "$TIME";
            color = "rgb(${colors.foregroundDim})";
            font_size = 16;
            font_family = "monospace";
            position = "0, 50";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };

    # Idle daemon - handles locking on suspend and auto-lock
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          # Dim screen after 2.5 minutes
          {
            timeout = 150;
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
          }
          # Lock screen after 5 minutes
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          # Turn off display after 5.5 minutes
          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          # Suspend after 30 minutes
          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
