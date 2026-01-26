{ ... }:

{
  flake.modules.homeManager.wofi = { pkgs, config, ... }:
  let
    colors = config.theme.colors;
  in
  {
    programs.wofi = {
      enable = true;

      style = ''
        * {
            font-family: "JetBrainsMono Nerd Font, monospace, sans-serif";
            font-weight: bold;
            font-size: 16px;
        }

        window {
            margin: 0px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            background-color: rgba(13, 17, 23, 0.9);
        }

        #input {
            margin: 8px;
            padding: 8px 14px;
            border: none;
            border-radius: 12px;
            color: #${colors.accent};
            background-color: rgba(255, 255, 255, 0.08);
        }

        #inner-box {
            margin: 5px;
            border: none;
            background-color: transparent;
        }

        #outer-box {
            margin: 5px;
            border: none;
            background-color: transparent;
        }

        #scroll {
            margin: 0px;
            border: none;
        }

        #text {
            margin: 5px;
            border: none;
            color: #${colors.foreground};
        }

        #entry {
            padding: 6px 14px;
            border-radius: 8px;
        }

        #entry:selected {
            background-color: #${colors.primary};
            color: #${colors.background};
        }

        #entry:hover {
            background-color: rgba(255, 255, 255, 0.08);
        }
      '';
    };
  };
}
