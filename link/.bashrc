# ~/.bashrc

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

export CLICOLOR=1
HISTSIZE=1000
EDITOR="vim"
HISTCONTROL=ignoredups
HISTFILESIZE=10000
HISTSIZE=10000
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
export MANPAGER="less -X"

# Colors
RED="\[\033[31m\]"
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'

# Custom Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[1m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[1m\]\
$(git branch 2>/dev/null|cut -f2 -d\* -s) $\[\033[00m\] '

# Load RVM into a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
