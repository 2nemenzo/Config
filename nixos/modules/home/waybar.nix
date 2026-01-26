{ ... }:

{
  flake.modules.homeManager.waybar = { config, pkgs, ... }:
  let
    colors = config.theme.colors;
  in
  {
    programs.waybar = {
      enable = true;

      settings = [{
        position = "bottom";
        layer = "top";
        height = 40;
        margin-bottom = 8;
        margin-left = 0;
        margin-right = 0;
        exclusive = true;

        modules-center = [
          "tray"
          "clock"
          "hyprland/workspaces"
          "pulseaudio"
          "network"
          "bluetooth"
          "battery"
        ];

        "hyprland/window" = {
          format = "{}";
        };

        "hyprland/submap" = {
          format = "{}";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
          persistent-workspaces = {
            "*" = 5;
          };
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        tray = {
          icon-size = 18;
          spacing = 10;
        };

        network = {
          format-icons = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
          format-wifi = "{icon}";
          format-ethernet = "";
          format-linked = "󰄡";
          format-disconnected = "";
          tooltip-format = "{essid} ({signalStrength}%) - {gwaddr}";
          tooltip-format-ethernet = "{ifname} - {gwaddr}";
          tooltip-format-disconnected = "Disconnected";
        };

        bluetooth = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-connected = "󰂱 {num_connections}";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "bluetooth toggle";
        };

        battery = {
          full-at = 95;
          states = {
            warning = 35;
            critical = 10;
          };
          format = "{icon}";
          format-plugged = "";
          format-charging = "󰂄";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          tooltip-format = "{capacity}%";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 0%";
          on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
          on-scroll-up = "wpctl set-volume -l 1.3 @DEFAULT_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_SINK@ 5%-";
          scroll-step = 5;
          format-icons = {
            headphone = "󱡏";
            hands-free = "󱡏";
            headset = "󱡏";
            default = [ "" "" ];
          };
        };

        clock = {
          format = "{:%R %a %m/%d}";
          tooltip-format = "{calendar}";
          calendar = {
            format = {
              months = "<span color='#${colors.yellow}'><b>{}</b></span>";
              days = "<span color='#${colors.foregroundDim}'><b>{}</b></span>";
              weekdays = "<span color='#${colors.green}'><b>{}</b></span>";
              today = "<span color='#${colors.green}'><b><u>{}</u></b></span>";
            };
          };
        };
      }];

      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: "JetBrainsMono Nerd Font";
          font-size: 14px;
          min-height: 0;
        }

        window#waybar {
          background: transparent;
        }

        .modules-center {
          background: #${colors.background};
          padding: 4px 16px;
          border-radius: 24px;
          margin: 4px 0;
        }

        tooltip {
          background: #${colors.background};
          border: 1px solid #${colors.backgroundAlt};
          border-radius: 12px;
        }

        tooltip label {
          color: #${colors.foreground};
          padding: 6px;
        }

        #workspaces {
          background: transparent;
          padding: 0;
          margin: 0 8px;
        }

        #workspaces button {
          padding: 0 6px;
          margin: 0 2px;
          border-radius: 12px;
          color: #${colors.foregroundDim};
          background: transparent;
          transition: all 0.2s ease-in-out;
        }

        #workspaces button.active {
          background: linear-gradient(135deg, #${colors.gradientStart}, #${colors.gradientMid}, #${colors.gradientEnd});
          color: #${colors.background};
          min-width: 32px;
        }

        #workspaces button:hover {
          background-color: #${colors.backgroundAlt};
          color: #${colors.foreground};
        }

        #workspaces button.urgent {
          background-color: #${colors.red};
          color: #${colors.background};
        }

        #clock,
        #pulseaudio,
        #network,
        #bluetooth,
        #battery,
        #tray,
        #submap,
        #window {
          color: #${colors.foreground};
          background: transparent;
          padding: 0 8px;
          margin: 0 2px;
        }

        #tray {
          margin-right: 4px;
        }

        #tray > .passive {
          -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #${colors.red};
        }

        #submap {
          color: #${colors.accent};
        }

        #battery.warning {
          color: #${colors.warning};
        }

        #battery.critical {
          color: #${colors.critical};
        }

        #network.disconnected {
          color: #${colors.foregroundDim};
        }

        #bluetooth.disabled {
          color: #${colors.foregroundDim};
        }

        #pulseaudio.muted {
          color: #${colors.foregroundDim};
        }
      '';
    };
  };
}
