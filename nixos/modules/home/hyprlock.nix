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

        background = [{
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
        }];

        input-field = [{
          size = "300, 50";
          outline_thickness = 2;
          dots_size = 0.25;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgb(${colors.primary})";
          inner_color = "rgb(${colors.background})";
          font_color = "rgb(${colors.foreground})";
          fade_on_empty = false;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          position = "0, -20";
          halign = "center";
          valign = "center";
        }];

        label = [
          # Time
          {
            text = "$TIME";
            color = "rgb(${colors.foreground})";
            font_size = 64;
            font_family = "JetBrainsMono Nerd Font";
            position = "0, 150";
            halign = "center";
            valign = "center";
          }
          # Date
          {
            text = "cmd[update:3600000] date '+%A, %B %d'";
            color = "rgb(${colors.foregroundDim})";
            font_size = 20;
            font_family = "JetBrainsMono Nerd Font";
            position = "0, 80";
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
