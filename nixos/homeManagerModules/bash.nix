
{pkgs, lib, config, ...} : {

	options = {
		bash.enable = lib.mkEnableOption "Enables bash config";
	};

# Conditionally enables the module of the enable option is true and does not if false :D
	config = lib.mkIf config.bash.enable {

		# simple bash config in home manager
		# Could do same for zsh but more work considering I have already made dotfiles for zsh
		# But I believe there is a way to use my dotfiles and use homemanger to symlink them and have it all in same repo
		# It is not purist but simple and would work when cloning and using my dots repo
		programs.bash = {
			enable = true; 
			shellAliases = {
				ll = "ls -l";
				".." = "cd .."; 
			};
		};
	};


			   }
