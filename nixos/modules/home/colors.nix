{ lib, ... }:

{
  flake.modules.homeManager.colors = { config, lib, ... }:
  let
    inherit (lib) mkOption types;
  in
  {
    options.theme.colors = {
      # Base colors
      background = mkOption {
        type = types.str;
        default = "0d1117";
        description = "Primary background color";
      };
      backgroundAlt = mkOption {
        type = types.str;
        default = "21262d";
        description = "Alternative/secondary background color";
      };
      backgroundLight = mkOption {
        type = types.str;
        default = "3b4252";
        description = "Light background color";
      };
      foreground = mkOption {
        type = types.str;
        default = "B8D4C6";
        description = "Primary foreground/text color";
      };
      foregroundDim = mkOption {
        type = types.str;
        default = "93B1A6";
        description = "Dimmed foreground color";
      };

      # Primary accent
      primary = mkOption {
        type = types.str;
        default = "6BA4E6";
        description = "Primary accent color";
      };
      primaryBright = mkOption {
        type = types.str;
        default = "7DB5F0";
        description = "Bright primary accent color";
      };

      # Secondary accent (cyan)
      accent = mkOption {
        type = types.str;
        default = "33ccff";
        description = "Secondary accent color (cyan)";
      };
      accentDim = mkOption {
        type = types.str;
        default = "6B9B8A";
        description = "Dimmed accent color";
      };

      # Semantic colors
      red = mkOption {
        type = types.str;
        default = "D3826E";
        description = "Red color";
      };
      redBright = mkOption {
        type = types.str;
        default = "E89580";
        description = "Bright red color";
      };
      green = mkOption {
        type = types.str;
        default = "8EAC50";
        description = "Green color";
      };
      greenBright = mkOption {
        type = types.str;
        default = "9DBE62";
        description = "Bright green color";
      };
      yellow = mkOption {
        type = types.str;
        default = "D3D04F";
        description = "Yellow color";
      };
      yellowBright = mkOption {
        type = types.str;
        default = "E5E161";
        description = "Bright yellow color";
      };
      blue = mkOption {
        type = types.str;
        default = "6BA4E6";
        description = "Blue color";
      };
      blueBright = mkOption {
        type = types.str;
        default = "7DB5F0";
        description = "Bright blue color";
      };
      magenta = mkOption {
        type = types.str;
        default = "7B9E87";
        description = "Magenta color";
      };
      magentaBright = mkOption {
        type = types.str;
        default = "8CAF98";
        description = "Bright magenta color";
      };
      cyan = mkOption {
        type = types.str;
        default = "6B9B8A";
        description = "Cyan color";
      };
      cyanBright = mkOption {
        type = types.str;
        default = "7DACAB";
        description = "Bright cyan color";
      };

      # UI-specific
      border = mkOption {
        type = types.str;
        default = "ffffff1a";
        description = "Border color (rgba format)";
      };
      shadow = mkOption {
        type = types.str;
        default = "00000066";
        description = "Shadow color (rgba format)";
      };
      overlay = mkOption {
        type = types.str;
        default = "000000bf";
        description = "Overlay color (rgba format)";
      };

      # Status colors
      warning = mkOption {
        type = types.str;
        default = "D3D04F";
        description = "Warning status color";
      };
      critical = mkOption {
        type = types.str;
        default = "D3826E";
        description = "Critical/error status color";
      };
      success = mkOption {
        type = types.str;
        default = "8EAC50";
        description = "Success status color";
      };
      info = mkOption {
        type = types.str;
        default = "6BA4E6";
        description = "Info status color";
      };

      # Gradients (for active states)
      gradientStart = mkOption {
        type = types.str;
        default = "6BA4E6";
        description = "Gradient start color";
      };
      gradientMid = mkOption {
        type = types.str;
        default = "7DB5F0";
        description = "Gradient middle color";
      };
      gradientEnd = mkOption {
        type = types.str;
        default = "33ccff";
        description = "Gradient end color";
      };
    };
  };
}
