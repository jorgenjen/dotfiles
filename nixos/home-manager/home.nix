{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jorgen";
  home.homeDirectory = "/home/jorgen";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello # Just for demo purposes

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jorgen/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

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

  programs.git.enable = true;
 
  # User globla gitconfig file
  home.file.".gitconfig" = {
 	text = ''
		[user]
		name = Jorgen Jensvold
		email = jorgenjensvold@gmail.com
		
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

  
  #programs.lazygit = {
  #  enabled = true;
  #};

	
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
