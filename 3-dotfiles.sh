#!/bin/bash


# ------------------------------------------------------
# Create symbolic links function by Stephan Raabe (2023)
# ------------------------------------------------------
_installSymLink() {
    name="$1"
    symlink="$2";
    linksource="$3";
    linktarget="$4";
    
    while true; do
        read -p "DO YOU WANT TO INSTALL ${name}? (Existing dotfiles will be removed!) (Yy/Nn): " yn
        case $yn in
            [Yy]* )
                if [ -L "${symlink}" ]; then
                    rm ${symlink}
                    ln -s ${linksource} ${linktarget} 
		            echo "Symlink ${linksource} -> ${linktarget} created."
                    echo ""
    		    else
	    	        if [ -d ${symlink} ]; then
                        rm -rf ${symlink}/ 
		    		    ln -s ${linksource} ${linktarget}
                        echo "Symlink for directory ${linksource} -> ${linktarget} created."
                        echo ""
           		    else
	    	            if [ -f ${symlink} ]; then
                            rm ${symlink} 
                    		ln -s ${linksource} ${linktarget} 
                            echo "Symlink to file ${linksource} -> ${linktarget} created."
                            echo ""
		                else
		                    ln -s ${linksource} ${linktarget} 
	                        echo "New symlink ${linksource} -> ${linktarget} created."
                            echo ""
                	    fi
                	fi
        	    fi
        break;;
            [Nn]* ) 
                # exit;
            break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}




clear
echo "     _       _    __ _ _            "
echo "  __| | ___ | |_ / _(_) | ___  ___  "
echo " / _' |/ _ \| __| |_| | |/ _ \/ __| "
echo "| (_| | (_) | |_|  _| | |  __/\__ \ "
echo " \__,_|\___/ \__|_| |_|_|\___||___/ "
echo "                                    "
echo "Modification of Stephan Raabe's script by Jørgen Jensvold"
echo "---------------------------------------------------------"
echo ""
echo "The script will ask for permission to remove existing folders and files."
echo "But you can decide to keep your local versions by answering with No (Nn)."
echo "Symbolic links will be created from the directory where this file is running"
echo "So ensure that the dotfiles are located in the same directory as the scripts"
echo "just like it was in the repo"
echo "you need the hyprdots repo for this to work this is included with hyprland amonst others"
echo ""

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done


# ------------------------------------------------------
# Create .config folder
# ------------------------------------------------------
echo ""
echo "-> Check if .config folder exists"

if [ -d ~/.config ]; then
    echo ".config folder already exists."
else
    mkdir ~/.config
    echo ".config folder created."
fi


# ------------------------------------------------------
# Detect the curent directory wich is for the symlinks
# ------------------------------------------------------
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"




# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
# name symlink source target

echo ""
echo "-------------------------------------"
echo "-> Install general dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink alacritty ~/.config/alacritty $SCRIPT_DIR/alacritty/ ~/.config
_installSymLink ranger ~/.config/ranger $SCRIPT_DIR/ranger/ ~/.config
#_installSymLink vim ~/.config/vim $SCRIPT_DIR/vim/ ~/.config
_installSymLink nvim ~/.config/nvim $SCRIPT_DIR/nvim/ ~/.config
_installSymLink starship ~/.config/starship.toml $SCRIPT_DIR/starship/starship.toml ~/.config/starship.toml
_installSymLink rofi ~/.config/rofi $SCRIPT_DIR/rofi/ ~/.config
_installSymLink dunst ~/.config/dunst $SCRIPT_DIR/dunst/ ~/.config
_installSymLink wal ~/.config/wal $SCRIPT_DIR/wal/ ~/.config

_installSymLink scripts ~/.config/scripts $SCRIPT_DIR/scripts ~/.config # Move the scripts to make it all more portable

echo "-------------------------------------"
echo "-> Install GTK dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink .gtkrc-2.0 ~/.gtkrc-2.0 $SCRIPT_DIR/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
_installSymLink gtk-3.0 ~/.config/gtk-3.0 $SCRIPT_DIR/gtk/gtk-3.0/ ~/.config/
_installSymLink .Xresouces ~/.Xresources $SCRIPT_DIR/gtk/.Xresources ~/.Xresources
_installSymLink .icons ~/.icons $SCRIPT_DIR/gtk/.icons/ ~/

#echo "-------------------------------------"
#echo "-> Install Qtile dotfiles"
#echo "-------------------------------------"
#echo ""

#_installSymLink qtile ~/.config/qtile ~/dotfiles/qtile/ ~/.config
#_installSymLink picom ~/.config/picom ~/dotfiles/picom/ ~/.config
#_installSymLink .xinitrc ~/.xinitrc ~/dotfiles/qtile/.xinitrc ~/.xinitrc

echo "-------------------------------------"
echo "-> Install Hyprland dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink hypr ~/.config/hypr $SCRIPT_DIR/hypr/ ~/.config
_installSymLink waybar ~/.config/waybar $SCRIPT_DIR/waybar/ ~/.config
_installSymLink swaylock ~/.config/swaylock $SCRIPT_DIR/swaylock/ ~/.config
_installSymLink wlogout ~/.config/wlogout $SCRIPT_DIR/Rwlogout/ ~/.config

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
echo "DONE! Please reboot your system!"
