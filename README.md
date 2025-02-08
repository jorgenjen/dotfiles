## My dotfiles

These dotfles are for both my hyprland and qtile window managers as I use both in addition to other configurations of programs such as neovim. The main purpose of this repo is for backup and easy install on new computers.

The more recent additions can be symlinked from where ever the repo is cloned to to their appropriate locations using the link.sh script. It will only link if the location it tries to link to does not have that file/directory otherwise it willi give a warning and not link

List the configs that the script can sym link:
```bash
sh link.sh list
```

Let the script link all configs that are supported (see list) 
```bash
sh link.sh all
```

Choose from the list the ones you want to symlink (here only nvim and wezterm will be linked)
```bash
sh link.sh nvim wezterm  
```


#### Credits and implementation information
Qtile config is a modification of the old version of [Cozytile](https://github.com/Darkkal44/CozyTile) by github user Darkkal44.

Hyprland is a slight modification of the amazing [dotfiles repository](https://gitlab.com/stephan-raabe/dotfiles) by Stephan Raabe.

Neovim is fully my own configuration using the lazy package manager
