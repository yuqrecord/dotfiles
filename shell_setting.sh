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


#] Make a directory having date name
function mkdirdate() {
  if [ $# -eq 0 ]; then
    mkdir $(date +%Y-%m-%d)
  elif [ $# -eq 1 ]; then
    if echo $1 | grep -q -v "^[-+]\?[1-9][0-9]*$" ; then
      echo "Usage: mkdirdate [integer]" 1>&2
      return 1
    fi
    if [ $(uname) = 'Darwin' ]; then
      day=$1
      # if [ $(echo $1 | grep -q -v "^-") -a $(echo $1 | grep -q "^+") ]; then
      if echo $1 | grep -q -v "^[-+]"; then
        day=$(echo $1 | sed "s/^/+/")
      else
        day=$1
      fi
      mkdir $(date -v${day}d +%Y-%m-%d)
    else
      if echo $1 | grep -q "^-" ; then
        day=$(echo $1 | sed "s/-//")
        mkdir $(date -d "${day} days ago" +%Y-%m-%d)
      else
        day=$(echo $1 | sed "s/+//")
        mkdir $(date -d "${day} days" +%Y-%m-%d)
      fi
    fi
  else
    echo "Usage: mkdirdate [integer]" 1>&2
    return 1
  fi
}

#] Change a directory to the one having date name
function cddate() {
  if [ $# -eq 0 ]; then
    cd $(date +%Y-%m-%d)
  elif [ $# -eq 1 ]; then
    if echo $1 | grep -q -v "^[-+]\?[1-9][0-9]*$" ; then
      echo "Usage: cddate [integer]" 1>&2
      return 1
    fi
    if [ $(uname) = 'Darwin' ]; then
      day=$1
      # if [ $(echo $1 | grep -q -v "^-") -a $(echo $1 | grep -q "^+") ]; then
      if echo $1 | grep -q -v "^[-+]"; then
        day=$(echo $1 | sed "s/^/+/")
      else
        day=$1
      fi
      cd $(date -v${day}d +%Y-%m-%d)
    else
      if echo $1 | grep -q "^-" ; then
        day=$(echo $1 | sed "s/-//")
        cd $(date -d "${day} days ago" +%Y-%m-%d)
      else
        day=$(echo $1 | sed "s/+//")
        cd $(date -d "${day} days" +%Y-%m-%d)
      fi
    fi
  else
    echo "Usage: cddate [integer]" 1>&2
    return 1
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
alias today='date "+%Y-%m-%d"'
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
