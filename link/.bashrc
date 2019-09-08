# ~/.bashrc

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

if [ -f ~/.profile ]; then
	. ~/.profile
fi

export CLICOLOR=1
EDITOR="vim"
HISTCONTROL=ignoredups
HISTFILESIZE=10000
HISTSIZE=10000
HISTIGNORE="ls:cd:cd -:pwd:exit:* --help"
export CLICOLOR=1
export XTERM=xterm-color
export TERM="xterm-256color"
export MANPAGER="less -X"
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim


# Colors
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'

# Custom Prompt
prompt_git_info () {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  is_dirty=$([[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*")
  has_staged=$([[ $(git diff --cached --shortstat 2> /dev/null | tail -n1) != "" ]] \
    && echo "+")
  echo " $is_dirty$git_branch${c_reset}$has_staged"
}

PS1=$GREEN'\u@\h '$YELLOW'\w'$CYAN'$(prompt_git_info)'$NIL' '

# Load RVM into a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh scp
#complete -o default -o nospace -W "$(grep -i -e '^host ' ~/.ssh/config | awk '{print substr($0, index($0,$2))}' ORS=' ')" ssh scp sftp

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
