{ ... }:

{
  flake.modules.homeManager.dev-tools = { pkgs, config, ... }: {
    home.packages = with pkgs; [
      ripgrep
      fd
      unzip
      cargo
      rustc
    ];

    home.sessionPath = [
      "${config.home.homeDirectory}/.cargo/bin"
    ];
  };
}
