{ config, ... }:

{
  flake.modules.homeManager.hyprland = { pkgs, ... }: {
	  home.packages = with pkgs; [
		  foot
			waybar
			kitty
			hyprpaper
			wofi
		];
	};
}
