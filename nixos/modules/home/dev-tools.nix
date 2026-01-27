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
    ];

    home.sessionPath = [
      "${config.home.homeDirectory}/.cargo/bin"
    ];
  };
}
