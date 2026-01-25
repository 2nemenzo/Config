{ ... }:

{
  flake.modules.homeManager.git = {
	  programs.git = {
		  enable = true;
			userName = "2nemenzo";
			userEmail = "nathanielnemenzo2@gmail.com";

			extraConfig = {
				init.defaultBranch = "main";
				pull.rebase = true;
			};
		};
	};
}
