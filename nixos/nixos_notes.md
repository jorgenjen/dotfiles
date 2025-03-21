## Updating system

` ` ` bash
nix flake update

` ` ` 
This will update the lock file getting the most recent version but I think it will still be limited to the release you are on but for unstable it will be the most recent of the package
The updated pacages will be used on next switch by both home manager and system configuration

This does not update the system it only updates the lock file so we need to run the rebuild command

` ` ` bash
sudo nixos-rebuild switch --flake /path/to/directory/with/flake/

` ` ` 

If your hostname and name for flake system configuration is different you need to add #confName to select the configuration you want to update the system with that is defined in the flake

## Home manager

the flake.lock is now used for both home manager and system configuration but the files and such are separate

Use the following command to update the based on home manager and lockfile 

` ` ` bash
home-manager switch --flake /path/to/directory/with/flake/

` ` ` 
This only updates the home-manager part so home.nix and the such that is in user space and dealt with by home-manager

To update system you need to do the nixos-rebuild switch --flake command  as shown above in Updating system


## Rollback home-manager

List generations:
```bash
home-manager generations

```


Choose the generation you wan to roll back to (biggest id is most recent)

Then copy the path to the nix store for that generation paste the contents into the terminal and add /activate to the string no space so it's part of path and that will activate that generation a bitt odd way of doing it. It is a script that resides in the nixstore for each generation so you are just running the script to activate it and hence rolling back to it. Remember this is all user level stuff so you config files etc not the main linux and all that
