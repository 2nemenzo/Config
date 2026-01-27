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

    # Add cargo bin to PATH for user-installed cargo packages
    home.sessionPath = [
      "${config.home.homeDirectory}/.cargo/bin"
    ];
  };
}
