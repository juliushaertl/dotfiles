#!/bin/bash

#
# Folder configuration
#
DOTDIR="$HOME/.dotfiles"
DOTDIR_BACKUP="$HOME/.dotfiles_old"

#
# Backup old dotfiles and install from git
#
if [ "$1" == "install" ]
then

    echo "Install dotfiles"
    git submodule init
    git submodule update

    mkdir $DOTDIR_BACKUP

    for f in `ls -A1 $DOTDIR/link`
    do
        if [ -L "$HOME/$f" ]; then
            echo "Unlink existing symlink for $f"
            rm -v "$HOME/$f"
        fi
        if ( ( [ -f "$HOME/$f" ] || [ -d "$HOME/$f" ])  &&  [ ! -L "$HOME/$f" ] ); then
            echo "Backup existing file $f"
       	    mv -v "$HOME/$f" "$DOTDIR_BACKUP"/$f
        fi
	echo "Linking to .dotfile/link/$f"
    	ln -s "$DOTDIR/link/$f" ~/$f
    done

    # System specific
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        echo "Install linux specific" 
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Install linux specific" 
        brew bundle $DOTDIR/Brewfile
    elif [[ "$OSTYPE" == "freebsd"* ]]; then
        echo "Install freebsd specific" 
        # ...
    else
        echo "Unknown OS" 
    fi
#
# Restore from dotfile backup
#
elif [ "$1" == "restore" ]
then

    echo "Restoring old dotfiles from $DOTDIR_BACKUP"
    for f in `ls -A1 $DOTDIR/link`
    do
        if [ -L "$HOME/$f" ]; then
    		echo "Removing $f"
    		rm -v "$HOME/$f"
    		echo "Restoring $f from backup"
    		if ( [ -f "$DOTDIR_BACKUP/$f" ] || [ -d "$DOTDIR_BACKUP/$f" ] ); then
	    		mv -v "$DOTDIR_BACKUP/$f" "$HOME"
	    	fi
        fi
    done
    rm -rv $DOTDIR_BACKUP

#
# Display help message
#
else

cat <<HELP
Usage: 
bash bootstrap.sh install   Install dotfiles
bash bootstrap.sh restore   Restore old dotfiles form backup

HELP
exit; 

fi

source ~/.bashrc
