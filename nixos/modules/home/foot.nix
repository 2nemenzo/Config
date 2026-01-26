{ ... }:

{
  flake.modules.homeManager.foot = { config, pkgs, ... }:
  let
    colors = config.theme.colors;
  in
  {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = "JetBrainsMono NF:size=14";
          pad = "4x4";
        };

        colors = {
          foreground = colors.foreground;
          background = colors.background;
          alpha = "0.9";

          # Normal/regular colors (color palette 0-7)
          regular0 = colors.backgroundAlt;   # black
          regular1 = colors.red;             # red
          regular2 = colors.green;           # green
          regular3 = colors.yellow;          # yellow
          regular4 = colors.blue;            # blue
          regular5 = colors.magenta;         # magenta
          regular6 = colors.cyan;            # cyan
          regular7 = colors.foreground;      # white

          # Bright colors (color palette 8-15)
          bright0 = colors.backgroundLight;  # bright black
          bright1 = colors.redBright;        # bright red
          bright2 = colors.greenBright;      # bright green
          bright3 = colors.yellowBright;     # bright yellow
          bright4 = colors.blueBright;       # bright blue
          bright5 = colors.magentaBright;    # bright magenta
          bright6 = colors.cyanBright;       # bright cyan
          bright7 = "D0E7DA";                # bright white

          # Dimmed colors
          dim0 = "4A5A54";
          dim1 = "B46B5A";
        };
      };
    };
  };
}
