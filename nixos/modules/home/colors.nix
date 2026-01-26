{ lib, ... }:

{
  flake.modules.homeManager.colors = { config, lib, ... }:
  let
    inherit (lib) mkOption types;
  in
  {
    options.theme.colors = {
      background = mkOption {
        type = types.str;
        default = "161616";
        description = "Primary background color (oxocarbon base00)";
      };
      backgroundAlt = mkOption {
        type = types.str;
        default = "262626";
        description = "Alternative/secondary background color (oxocarbon base01 ~8.5% blend)";
      };
      backgroundLight = mkOption {
        type = types.str;
        default = "393939";
        description = "Light background color (oxocarbon base02 ~18% blend)";
      };
      foreground = mkOption {
        type = types.str;
        default = "f2f4f8";
        description = "Primary foreground/text color (oxocarbon base05 ~95% blend)";
      };
      foregroundDim = mkOption {
        type = types.str;
        default = "dde1e6";
        description = "Dimmed foreground color (oxocarbon base04 ~82% blend)";
      };

      # Primary accent (oxocarbon blue)
      primary = mkOption {
        type = types.str;
        default = "78a9ff";
        description = "Primary accent color (oxocarbon base09 - blue)";
      };
      primaryBright = mkOption {
        type = types.str;
        default = "33b1ff";
        description = "Bright primary accent color (oxocarbon base11 - light blue)";
      };

      # Secondary accent (oxocarbon cyan/teal)
      accent = mkOption {
        type = types.str;
        default = "3ddbd9";
        description = "Secondary accent color (oxocarbon base08 - bright cyan)";
      };
      accentDim = mkOption {
        type = types.str;
        default = "08bdba";
        description = "Dimmed accent color (oxocarbon base07 - teal)";
      };

      # Semantic colors
      red = mkOption {
        type = types.str;
        default = "ee5396";
        description = "Red/pink color (oxocarbon base10)";
      };
      redBright = mkOption {
        type = types.str;
        default = "ff7eb6";
        description = "Bright red/pink color (oxocarbon base12)";
      };
      green = mkOption {
        type = types.str;
        default = "42be65";
        description = "Green color (oxocarbon base13)";
      };
      greenBright = mkOption {
        type = types.str;
        default = "42be65";
        description = "Bright green color (oxocarbon base13)";
      };
      yellow = mkOption {
        type = types.str;
        default = "82cfff";
        description = "Yellow color - using light cyan (oxocarbon base15)";
      };
      yellowBright = mkOption {
        type = types.str;
        default = "82cfff";
        description = "Bright yellow color - using light cyan (oxocarbon base15)";
      };
      blue = mkOption {
        type = types.str;
        default = "78a9ff";
        description = "Blue color (oxocarbon base09)";
      };
      blueBright = mkOption {
        type = types.str;
        default = "33b1ff";
        description = "Bright blue color (oxocarbon base11)";
      };
      magenta = mkOption {
        type = types.str;
        default = "be95ff";
        description = "Magenta/purple color (oxocarbon base14)";
      };
      magentaBright = mkOption {
        type = types.str;
        default = "ff7eb6";
        description = "Bright magenta/pink color (oxocarbon base12)";
      };
      cyan = mkOption {
        type = types.str;
        default = "08bdba";
        description = "Cyan/teal color (oxocarbon base07)";
      };
      cyanBright = mkOption {
        type = types.str;
        default = "3ddbd9";
        description = "Bright cyan color (oxocarbon base08)";
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
        default = "131313bf";
        description = "Overlay color using oxocarbon blend (rgba format)";
      };

      # Status colors
      warning = mkOption {
        type = types.str;
        default = "be95ff";
        description = "Warning status color (oxocarbon base14 - purple)";
      };
      critical = mkOption {
        type = types.str;
        default = "ee5396";
        description = "Critical/error status color (oxocarbon base10 - pink)";
      };
      success = mkOption {
        type = types.str;
        default = "42be65";
        description = "Success status color (oxocarbon base13 - green)";
      };
      info = mkOption {
        type = types.str;
        default = "78a9ff";
        description = "Info status color (oxocarbon base09 - blue)";
      };

      gradientStart = mkOption {
        type = types.str;
        default = "78a9ff";
        description = "Gradient start color (oxocarbon base09 - blue)";
      };
      gradientMid = mkOption {
        type = types.str;
        default = "33b1ff";
        description = "Gradient middle color (oxocarbon base11 - light blue)";
      };
      gradientEnd = mkOption {
        type = types.str;
        default = "3ddbd9";
        description = "Gradient end color (oxocarbon base08 - cyan)";
      };
    };
  };
}
