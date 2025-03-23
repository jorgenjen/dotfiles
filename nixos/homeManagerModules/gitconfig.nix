


{pkgs, lib, config, ...} : {

	options = {
		gitconfig.enable = lib.mkEnableOption "Enables bash config";
	};

	config = lib.mkIf config.gitconfig.enable {
		programs.git.enable = true;

		# User globla gitconfig file
		home.file.".gitconfig" = {
			text = ''
				[user]
				name = Jorgen Jensvold
				email = jorgenjensvold@gmail.com

				# Values stated before this line can be overwritten by the configs in the includeIf
				# In gitconfig it is the last one setting it that counts and is used
				[includeIf "gitdir:~/personal/"]
				path = ~/.config/git/personal_config_github

			'';
		};

		home.file.".config/git/personal_config_github" = {
			text = ''
				[user]
				name = Jorgen Jensvold
				email = jorgenjensvold@gmail.com

				[github]
				user = jorgenjen

				# You need to do ssh key gen with this location and add to ssh agent and add to github see my README.md under NixOS in the repo	
				[core]
				sshCommand = "ssh -i ~/.ssh/github_jorgenjen_sshkey"
				editor = "nvim"
			'';
		};

	};
}


