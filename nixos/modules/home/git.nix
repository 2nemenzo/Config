{ ... }:

{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "2nemenzo";
          email = "47703615+2nemenzo@users.noreply.github.com";
        };
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
  };
}
