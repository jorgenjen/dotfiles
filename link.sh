#!/bin/bash

# Note to self, bash is qiute peculiar when it comes to spaces...

args=("$@")  

# Configured programs in repo (that should be linkable)
# Should only be in one of the lists
CONFIGS_DIR=("nvim" "wezterm")  # Move directory into .config
CONFIGS_BASE=("zsh" "starship") # move the config file into .config

loop_link() {
  for CONFIG in "$@"; do

    
    foundDir=false
    foundBase=false 
    for item in "${CONFIGS_DIR[@]}"; do
      if [[ "$item" == "$CONFIG" ]]; then
        foundDir=true
        break
      fi
    done

    for item in "${CONFIGS_BASE[@]}"; do
      if [[ "$item" == "$CONFIG" ]]; then
        foundBase=true
        break
      fi
    done
    

    if $foundDir; then
      if [[ -d "$HOME/.config/$CONFIG" || -L "$HOME/.config/$CONFIG" ]]; then
        echo -e "WARNING: $HOME/.config/$CONFIG directory/symlink exists..."
        echo -e "\tMove/remove/rename it if you want to set up the symlink:"
        echo -e "\t\t$PWD/$CONFIG -> $HOME/.config/$CONFIG\n"
      else
        echo -e "Creating symlink: $PWD/$CONFIG -> $HOME/.config/$CONFIG"
        ln -s "$PWD/$CONFIG" "$HOME/.config/$CONFIG"
      fi
    elif $foundBase; then
      echo -e "\nLinking all files in $PWD/$CONFIG/ to $HOME/.config/"
      fileNames=`ls -A ./$CONFIG/`
      for file in $fileNames
      do
        echo -e "\tCreating symlink: $PWD/$CONFIG/$file -> $HOME/.config/$file"
        ln -s "$PWD/$CONFIG/$file" "$HOME/.config/$file"
      done
    else
      echo "WARNING: $CONFIG is not a linkable dotfiles directory in this repo!"
    fi
  done
}


if [[ "$#" -eq 1 && "${args[0]}" == "all" ]]; then
  echo -e "Linking all dotfiles in repo...\n"
  loop_link "${CONFIGS_DIR[@]}" "${CONFIGS_BASE[@]}"
  
elif [[ "$#" -eq 1 && "${args[0]}" == "list" ]]; then
  echo "Linkable dofiles directory names:"
  for item in "${CONFIGS_DIR[@]}" "${CONFIGS_BASE[@]}"; do
    echo -e "\t$item"
  done
elif [[ "$#" -eq 0 ]]; then 
  echo  "You need to supply arguments: "
  echo -e "\tsh link.sh all               -- Symlinkns all dotfiles in repo"
  echo -e "\tsh link.sh nvim wezterm      -- Symlinks your selected directory names"
  echo -e "\tsh link.sh list              -- To list all linkable dofiles directories in 
                                        this repo. Does not do any linking!\n"
else
  echo -e "Looping over given directories...\n"
  loop_link "${args[@]}"
fi
