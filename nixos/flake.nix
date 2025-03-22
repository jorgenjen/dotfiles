{
	description = "My initial flake!";

	# Inputs are mainly git repo's
	inputs = {
		# nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # If you want to use the latest packages
		# Currently using stable release
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
		home-manager.url = "github:nix-community/home-manager/release-24.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Ensures that they are the same to avoid issues
	};

	# Outputs describes the system and configuration of inputs I thinkn

	# First {} is passing arguments into the outputs so that we can use the input nixpkgs for instance
	outputs = { self, nixpkgs, home-manager, ... }:
		let 
			lib = nixpkgs.lib; # Set variable that we can use in the output block which is after in
			system = "x86_64-linux"; # one variable that is used to set system architecture
			pkgs = nixpkgs.legacyPackages.${system};
		in {
			
		# Add #sb2 to flake path to use that configuration eg: sudo nixos-rebuild switch --flake /flake/path#sb2
		# This is how you choose configuration to build on different systems that you maintain
		nixosConfigurations = {
			# Can call this variable (configuration name) whatever you want (going with host name)
			nixos = lib.nixosSystem {
				inherit system; # same as having this (system = "x86_64-linux";) but now system is only set once
				modules = [ ./configuration.nix ];
			};
			 
			sb2 = lib.nixosSystem {
				inherit system; # same as having this (system = "x86_64-linux";) but now system is only set once
				modules = [ ./hosts/sb2/configuration.nix ];
			};
		};


		homeConfigurations = {
			# Name of your user is normal to use for home manager configuration
			jorgen = home-manager.lib.homeManagerConfiguration {
				inherit pkgs; # Takes the varialbe from letbinding and passes it to function/configuration
				modules = [ ./home-manager/home.nix ];
			};

			# Use by adding #jorgen@sb2 to the flake path eg: home-manager switch --flake /flake/path#jorgen@sb2
			"jorgen@sb2" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs; # Takes the varialbe from letbinding and passes it to function/configuration
				modules = [ ./hosts/sb2/home.nix ];
			};
		};	
	};

}
