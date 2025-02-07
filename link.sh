#!/bin/bash

# Note to self, bash is qiute peculiar when it comes to spaces...

args=("$@")  

# Configured programs in repo (that should be linkable)
CONFIGS=("nvim" "wezterm")  # No spaces between elements

loop_link() {
  for CONF in "$@"; do

    # Check if CONF is in the list of linkable dirs
    found=false
    for item in "${CONFIGS[@]}"; do
      if [[ "$item" == "$CONF" ]]; then
        found=true
        break
      fi
    done

    if $found; then
      if [[ -d "$HOME/.config/$CONF" || -L "$HOME/.config/$CONF" ]]; then
        echo -e "WARNING: $HOME/.config/$CONF directory/symlink exists..."
        echo -e "\tMove/remove/rename it if you want to set up the symlink:"
        echo -e "\t\t$PWD/$CONF -> $HOME/.config/$CONF\n"
      else
        echo -e "Creating symlink: $PWD/$CONF -> $HOME/.config/$CONF"
        ln -s "$PWD/$CONF" "$HOME/.config/$CONF"
      fi
    else
      echo "WARNING: $CONF is not a linkable dotfiles directory in this repo!"
    fi
  done
}


if [[ "$#" -eq 1 && "${args[0]}" == "all" ]]; then
  echo -e "Linking all dotfiles in repo...\n"
  loop_link "${CONFIGS[@]}"
elif [[ "$#" -eq 0 ]]; then 
  echo  "You need to supply arguments: "
  echo -e "\tsh link.sh all               -- Symlinkns all dotfiles in repo"
  echo -e "\tsh link.sh nvim wezterm      -- Symlinks your selected directory names\n"
else
  echo -e "Looping over given directories...\n"
  loop_link "${args[@]}"
fi
