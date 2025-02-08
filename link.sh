#!/bin/bash

# Note to self, bash is qiute peculiar when it comes to spaces...

args=("$@")  

# Color varialbes that can be used to make echo -e colorful :D 
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`
BOLD=`tput bold`
RESET=`tput sgr0`

# Configured programs in repo (that should be linkable)
# Should only be in one of the lists
CONFIGS_DIR=("nvim" "wezterm")   # Move directory into .config
CONFIGS_BASE_CONFIG=("starship") # Move the config file in dir into .config
CONFIGS_BASE_HOME=("zsh")        # move the config file in dir into $HOME

loop_link() {
  for CONFIG in "$@"; do
    foundDir=false
    foundBaseConfig=false 
    foundBaseHome=false
    for item in "${CONFIGS_DIR[@]}"; do
      if [[ "$item" == "$CONFIG" ]]; then
        foundDir=true
        break
      fi
    done

    for item in "${CONFIGS_BASE_CONFIG[@]}"; do
      if [[ "$item" == "$CONFIG" ]]; then
        foundBaseConfig=true
        break
      fi
    done

    for item in "${CONFIGS_BASE_HOME[@]}"; do
      if [[ "$item" == "$CONFIG" ]]; then
        foundBaseHome=true
        break
      fi
    done
    
    if $foundDir; then
      if [[ -d "$HOME/.config/$CONFIG" || -L "$HOME/.config/$CONFIG" ]]; then
        echo -e "${YELLOW}WARNING:${RESET} $HOME/.config/$CONFIG directory/symlink exists..."
        echo -e "\tMove/remove/rename it if you want to set up the symlink:"
        echo -e "\t\t${CYAN}$PWD/$CONFIG -> $HOME/.config/$CONFIG\n${RESET}"
      else
        echo -e "Creating symlink: ${CYAN}$PWD/$CONFIG -> $HOME/.config/$CONFIG${RESET}"
        ln -s "$PWD/$CONFIG" "$HOME/.config/$CONFIG"
      fi
    elif $foundBaseConfig; then
      echo -e "\nLinking all files in $PWD/$CONFIG/ to $HOME/.config/"
      fileNames=`ls -A ./$CONFIG/`
      for file in $fileNames
      do
        if [ -f "$HOME/.config/$file" ]; then
          echo -e "${YELLOW}WARNING:${RESET} $HOME/.config/$file file/symlink exists..."
          echo -e "\tMove/remove/rename it if you want to set up the symlink:"
          echo -e "\t\t${CYAN}$PWD/$CONFIG/$file -> $HOME/.config/$file\n${RESET}"
        else
          echo -e "\t${CYAN}Creating symlink: ${CYAN}$PWD/$CONFIG/$file -> $HOME/.config/$file${RESET}"
          ln -s "$PWD/$CONFIG/$file" "$HOME/.config/$file"
        fi
      done
    elif $foundBaseHome; then
      echo -e "\nLinking all files in $PWD/$CONFIG/ to $HOME/"
      fileNames=`ls -A ./$CONFIG/`
      for file in $fileNames
      do
        if [ -f "$HOME/$file" ]; then
          echo -e "${YELLOW}WARNING:${RESET} $HOME/$file file/symlink exists..."
          echo -e "\tMove/remove/rename it if you want to set up the symlink:"
          echo -e "${CYAN}\t\t$PWD/$CONFIG/$file -> $HOME/$file\n${RESET}"
        else
          echo -e "\tCreating symlink: ${CYAN}$PWD/$CONFIG/$file -> $HOME/$file${RESET}"
          ln -s "$PWD/$CONFIG/$file" "$HOME/$file"
        fi
      done
    else
      echo "${YELLOW}WARNING:${RESET} $CONFIG is not a linkable dotfiles directory in this repo!"
    fi
  done
}


if [[ "$#" -eq 1 && "${args[0]}" == "all" ]]; then
  echo -e "Linking all dotfiles in repo...\n"
  loop_link "${CONFIGS_DIR[@]}" "${CONFIGS_BASE_CONFIG[@]}" "${CONFIGS_BASE_HOME[@]}"
  
elif [[ "$#" -eq 1 && "${args[0]}" == "list" ]]; then
  echo "Linkable dofiles directory names:"
  for item in "${CONFIGS_DIR[@]}" "${CONFIGS_BASE_CONFIG[@]}" "${CONFIGS_BASE_HOME[@]}"; do
    echo -e "\t${BLUE}$item"
  done
  echo -e "${RESET}" # Reset after lising in blue
elif [[ "$#" -eq 0 ]]; then 
  echo  "You need to supply arguments: "
  echo -e "\t${GREEN}sh${RESET} link.sh all               -- Symlinkns all linkable dotfiles in repo"
  echo -e "\t${GREEN}sh${RESET} link.sh nvim wezterm      -- Symlinks your selected directory names"
  echo -e "\t${GREEN}sh${RESET} link.sh list              -- To list all linkable dofiles directories in 
                                        this repo. Does not do any linking!\n"
else
  echo -e "Looping over given directories...\n"
  loop_link "${args[@]}"
fi
