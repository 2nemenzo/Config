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
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
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
