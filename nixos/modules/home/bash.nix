{ ... }:

{
  flake.modules.homeManager.bash = { config, pkgs, lib, ... }:
  let
    colors = config.theme.colors;
    # Convert hex to RGB for ANSI escape sequences
    hexToRgb = hex: let
      r = builtins.substring 0 2 hex;
      g = builtins.substring 2 2 hex;
      b = builtins.substring 4 2 hex;
      toInt = s: builtins.foldl' (a: c: a * 16 + (
        if c >= "0" && c <= "9" then builtins.fromJSON c
        else if c == "a" || c == "A" then 10
        else if c == "b" || c == "B" then 11
        else if c == "c" || c == "C" then 12
        else if c == "d" || c == "D" then 13
        else if c == "e" || c == "E" then 14
        else 15
      )) 0 (lib.stringToCharacters s);
    in "${toString (toInt r)};${toString (toInt g)};${toString (toInt b)}";
  in
  {
    programs.bash = {
      enable = true;

      initExtra = ''
        # Oxocarbon-themed prompt using system colors
        PRIMARY_RGB="${hexToRgb colors.primary}"
        GREEN_RGB="${hexToRgb colors.green}"
        MAGENTA_RGB="${hexToRgb colors.magenta}"

        PS1='\[\e[38;2;'"$MAGENTA_RGB"'m\]\u\[\e[0m\] \[\e[38;2;'"$PRIMARY_RGB"'m\]\w\[\e[0m\] \[\e[38;2;'"$GREEN_RGB"'m\]❯\[\e[0m\] '
      '';
    };
  };
}
