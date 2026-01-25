{ ... }:

{
  flake.modules.homeManager.theming = { pkgs, ... }: {
    home.packages = with pkgs; [
      fontconfig
      nerd-fonts.jetbrains-mono
    ];

    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.apple-cursor;
      name = "macOS-White";
      size = 20;
    };

    gtk = {
      enable = true;
      font.name = "Jetbrains Mono";
      theme = {
        name = "vimix-dark-doder";
        package = pkgs.vimix-gtk-themes;
      };
      iconTheme = {
        name = "Vimix-Doder-Dark";
        package = pkgs.vimix-icon-theme;
      };
    };
  };
}
