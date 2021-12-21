#] Confirm no job when exiting
function confirm_exit() {
  if [ $(jobs | wc -l) -ne 0 ]; then
    echo "If you really want to exit, you need use \`exit\` command without an alias."
    echo "There are following jobs:"
    jobs
  else
    exit
  fi
}



#] Aliases
alias ls='ls -F'
alias sl='ls -F'
alias la='ls -a'
alias ll='ls -l'
alias lk='ls -F1'
alias lf='ls -F1sSh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias less='less --tabs=2'
alias x='confirm_exit'
alias exit='confirm_exit'
alias vir='vim -R'
alias duu='du -h --max-depth=1'
alias python='python3 -B'
alias py='python3 -B'
alias ctags='`brew --prefix`/bin/ctags'
alias grep='grep --color=auto'
alias mps='ps aux | head -n 1 ; ps aux | grep $(whoami)'
alias date8digits='date "+%Y%m%d"'
if [ $(uname) = 'Darwin' ]; then
  alias sed='gsed'
fi


#] Setting of the path
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"


#] Setting of less command
if [ $(uname) = 'Linux' ]; then
  lesskey ~/.lesskey
  setxkbmap -option ctrl:swapcaps
fi


#] Settings for zsh
if [ $(ps $$ | tail -n 1 | awk '{print $NF}' | grep 'zsh') ]; then

  #] Do not kill process using ctrl-D
  setopt ignoreeof

  #] To use command 'r' for the programing langauge 'R'
  disable r

  #] Not beep
  setopt no_beep

  #] For complementing word in Git
  autoload -U compinit
  compinit -u

#] Settings for bash
elif [ $(ps $$ | tail -n 1 | awk '{print $NF}' | grep 'bash') ]; then

  #] Do not kill process using ctrl-D
  IGNOREEOF=100

  #] Not beep
  set bell-style none

  #] For complementing word in Git
  if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
  fi
  if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
  fi

fi
