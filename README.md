# dofiles

- `link` containing files or directories will be linked to `$HOME`
- `scripts` helper scripts expected to be in `$HOME/.dotfiles`

## install dotfiles

    git clone git://github.com/juliushaertl/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    bash bootstrap.sh

The bootstrap.sh script will backup the users existing dotfiles to .dotfiles_old
and link the files from link/ to the users homefolder. The repo must be cloned
into ~/.dotfiles

    bash bootstrap.sh restore

will remove the symbolic links and move the files from .dotfiles_old back to the
homefolder.

## backup

The backup scripts require having the restic repository password set in the gnome keychain

## zsh

Use zsh as your default shell

    chsh -s /bin/zsh

## vim

Vim is configured to use pathogen to install plugins, so everything in
.vim/bundle will be added to the `runtimepath`. 

New submodules can be added like this:

    cd .vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim as submodule"

Plugins can be upgraded with:

    git submodule foreach git pull origin master
