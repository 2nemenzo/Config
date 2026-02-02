{ ... }:

{
  flake.modules.homeManager.dev-tools = { pkgs, config, ... }: {
    home.packages = with pkgs; [
      ripgrep
      fd
      unzip
      cargo
      rustc
      rustfmt
      clippy
      zola
      nodejs
      stylua
      nixfmt-rfc-style
    ];

    home.sessionPath = [
      "${config.home.homeDirectory}/.cargo/bin"
    ];
  };
}
