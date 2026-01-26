# Centralized color palette for the entire system
# Import this file from any module that needs consistent colors
#
# Usage in other modules:
#   let colors = import ./colors.nix; in
#   ... colors.primary ...
#
{
  # Base colors
  background = "0d1117";
  backgroundAlt = "21262d";
  backgroundLight = "3b4252";
  foreground = "B8D4C6";
  foregroundDim = "93B1A6";

  # Primary accent
  primary = "6BA4E6";
  primaryBright = "7DB5F0";

  # Secondary accent (cyan)
  accent = "33ccff";
  accentDim = "6B9B8A";

  # Semantic colors
  red = "D3826E";
  redBright = "E89580";
  green = "8EAC50";
  greenBright = "9DBE62";
  yellow = "D3D04F";
  yellowBright = "E5E161";
  blue = "6BA4E6";
  blueBright = "7DB5F0";
  magenta = "7B9E87";
  magentaBright = "8CAF98";
  cyan = "6B9B8A";
  cyanBright = "7DACAB";

  # UI-specific
  border = "ffffff1a";  # rgba(255, 255, 255, 0.1)
  shadow = "00000066";  # rgba(0, 0, 0, 0.4)
  overlay = "000000bf"; # rgba(0, 0, 0, 0.75)

  # Status colors
  warning = "D3D04F";
  critical = "D3826E";
  success = "8EAC50";
  info = "6BA4E6";

  # Gradients (for active states)
  gradientStart = "6BA4E6";
  gradientMid = "7DB5F0";
  gradientEnd = "33ccff";
}
