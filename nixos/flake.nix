{
	description = "My modular multi host/system flake with my config files (with impureties of symlink out of nix store)";

	# Inputs are mainly git repo's
	inputs = {
		# nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # If you want to use the latest packages
		# Currently using stable release
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
		home-manager.url = "github:nix-community/home-manager/release-24.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Ensures that they are the same to avoid issues
	};

	# Different configurations both for nixos (configuration.nix) and home-manager (home.nix)
	outputs = { self, nixpkgs, home-manager, ... }:
		let 
			lib = nixpkgs.lib; # Set variable that we can use in the output block which is after in
			system = "x86_64-linux"; # one variable that is used to set system architecture
			pkgs = nixpkgs.legacyPackages.${system};
		in {
			
		# Add #sb2 to flake path to use that configuration eg: sudo nixos-rebuild switch --flake /flake/path#sb2
		# This is how you choose configuration to build on different systems that you maintain
		nixosConfigurations = {
			# Choose config when doing sudo nixos-rebuild switch --flake /flake/path#VARIABLE
			# 	Where VARIABLE is one of the varaibles below that represents a config (host) eg: sb2
			 
			sb2 = lib.nixosSystem {
				inherit system; # same as having this (system = "x86_64-linux";) but now system is only set once
				modules = [ ./hosts/sb2/configuration.nix ];
			};
		};

		homeConfigurations = {
			# Choose configuration when doing home-manager switch --flake /flake/path#VARIABLE
			#	Where VARIABLE is the variable name of the configuration you want to use eg jorgen@sb2

			"jorgen@sb2" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs; # Takes the varialbe from letbinding and passes it to function/configuration
				modules = [ ./hosts/sb2/home.nix ];
			};
		};	
	};

}
