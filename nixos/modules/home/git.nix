{ ... }:

{
  flake.modules.homeManager.git = {
	  programs.git = {
		  enable = true;
			userName = "2nemenzo";
			userEmail = "47703615+2nemenzo@users.noreply.github.com";

			extraConfig = {
				init.defaultBranch = "main";
				pull.rebase = true;
			};
		};
	};
}
