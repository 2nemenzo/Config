{ ... }:

{
  flake.modules.homeManager.wofi = { pkgs, ... }: {
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
            background-color: rgba(0, 0, 0, 0.75);
        }

        #input {
            margin: 8px;
            padding: 8px 14px;
            border: none;
            border-radius: 12px;
            color: #33ccff;
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
            color: #B8D4C6;
        }

        #entry {
            padding: 6px 14px;
            border-radius: 8px;
        }

        #entry:selected {
            background-color: #6BA4E6;
            color: #0d1117;
        }

        #entry:hover {
            background-color: rgba(255, 255, 255, 0.08);
        }
      '';
    };
  };
}
