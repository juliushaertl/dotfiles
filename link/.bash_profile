if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export PATH=~/.bin/:/usr/local/bin:/usr/local/sbin:$PATH

eval $(ssh-agent)
