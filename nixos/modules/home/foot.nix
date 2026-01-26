{ ... }:

{
  flake.modules.homeManager.foot = { pkgs, ... }: {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = "JetBrainsMono NF:size=14";
          pad = "4x4";
        };

        colors = {
          foreground = "B8D4C6";
          background = "0d1117";
          alpha = "0.9";

          # Normal/regular colors (color palette 0-7)
          regular0 = "21262d";   # black
          regular1 = "D3826E";   # red
          regular2 = "8EAC50";   # green
          regular3 = "D3D04F";   # yellow
          regular4 = "6BA4E6";   # blue - Changed from #5C8374 (teal) to light blue
          regular5 = "7B9E87";   # magenta
          regular6 = "6B9B8A";   # cyan
          regular7 = "B8D4C6";   # white

          # Bright colors (color palette 8-15)
          bright0 = "3b4252";    # bright black
          bright1 = "E89580";    # bright red
          bright2 = "9DBE62";    # bright green
          bright3 = "E5E161";    # bright yellow
          bright4 = "7DB5F0";    # bright blue - Changed from #6E9485 to brighter light blue
          bright5 = "8CAF98";    # bright magenta
          bright6 = "7DACAB";    # bright cyan
          bright7 = "D0E7DA";    # bright white

          # Dimmed colors
          dim0 = "4A5A54";
          dim1 = "B46B5A";
        };
      };
    };
  };
}
