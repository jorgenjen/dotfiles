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


## Updates

I beliieve you can upgrade all you need by doing nix flake update but it seems you can also do it for nixos-rebuild (not sure if you should when using flake]

```bash
sudo nixos-rebuild switch --upgrade

```

Not sure if it should be done with flakes

Doing normal rebuild only rebuilds with packages already in nix store( which is local) and does not fetch new versions from the web then you need to use one of the two mentioned methods use the flake one first if using flakes if that does not have desired result you can try the other one but I believe it is not reqired as stated


## Maintanance (garbage collecting nix store)

Nix stores all previous versions in nix store and over time with updates (if you run them) it will accumulate and take up alot of space so you should garbage collect (aka remove olds stuff when no longer needed) 

1. Delete all old generations

```bash
nix-collect-garbage -d

```

2. Delete allgenerations older than a set value (10 days in this example)

```bash
nix-collect-garbage -d --delete-older-than 10d
```

Garbage collection can also be automated by setting some values in the configuration.nix file which is probably smart later on when I'm more comfortable and stable


## Untracked git files
 
If you try to use a files that are untracked by git it will show as it does not exist when you do rebuild and home-manager switch for some reason untracked files are ignored so when doing name or hierical changes you need to do git add before they will work... Odd design but that is how it is and annyoing to forget...
