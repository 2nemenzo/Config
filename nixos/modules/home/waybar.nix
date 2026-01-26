{ ... }:

{
  flake.modules.homeManager.waybar = { pkgs, ... }: {
    programs.waybar = {
      enable = true;

      settings = [{
        position = "bottom";
        margin = "0 0 0 0";
        mod = "dock";

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
            "*" = "5";
          };
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
        };

        tray = {
          icon-size = 18;
          spacing = 20;
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
              months = "<span color='#D3D04F'><b>{}</b></span>";
              days = "<span color='#93B1A6'><b>{}</b></span>";
              weekdays = "<span color='#8EAC50'><b>{}</b></span>";
              today = "<span color='#8EAC50'><b><u>{}</u></b></span>";
            };
          };
        };
      }];

      style = ''
        * {
          border: none;
          border-radius: 0px;
          font-family: "JetBrainsMono Nerd Font, monospace, sans-serif";
          font-size: 16px;
          min-height: 0;
          padding: 0;
          margin: 0;
        }
        .modules-center {
          background: #TODO;
          padding: 6px 12px;
          border-radius: 28px;
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }
        window#waybar {
          background: transparent;
        }
        tooltip {
          background: #TODO;
          border: 1px solid #TODO;
          border-radius: 12px;
        }
        tooltip label {
          color: #TODO;
          padding: 6px;
        }
        #workspaces {
          background: transparent;
          padding: 0;
          margin: 0 10px 0 10px;
          border: none;
          box-shadow: none;
        }
        #workspaces button {
          padding: 0px 6px;
          margin: 0px 2px;
          border-radius: 16 px;
          color: #TODO;
          background: transparent;
          transition: all 0.3s ease-in-out;
        }
        #workspaces button.active {
          background: linear-gradient(135deg, #TODO, #TODO, #TODO);
          color: #TODO;
          min-width: 40px;
          transition: all 0.3s ease-in-out;
        }
        #workspaces button:hover {
          background-color: #TODO;
          color: #TODO;
        }
        #workspaces button.urgent {
          background-color: #TODO;
          color: #TODO;
        }

        #clock,
        #pulseaudio,
        #network,
        #bluetooth,
        #battery,
        #submap,
        #window {
          background-color: #TODO;
          padding: 0 8px;
          margin: 0 5px;
          border-radius: 0;
          border: none;
          box-shadow: none;
        }

        #submap {
          color: #TODO;
        }

        #clock {
          color: #TODO;
          margin: 0;
        }

        #battery.warning {
            color: orange;
        }
        #battery.critical {
            color: red;
        }
        #clock {
            padding-right: 16px;
            border-radius: 0;
        }
      '';
    };
  };
}
