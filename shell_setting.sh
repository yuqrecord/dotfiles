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

#] Print a string haveing date name
function echodate() {
  if [ $# -eq 0 ]; then
    echo $(date +%Y-%m-%d)
  elif [ $# -eq 1 ]; then
    if echo $1 | grep -q -v "^[-+]\?[1-9][0-9]*$" ; then
      echo "Usage: echodate [integer]" 1>&2
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
      echo $(date -v${day}d +%Y-%m-%d)
    else
      if echo $1 | grep -q "^-" ; then
        day=$(echo $1 | sed "s/-//")
        echo $(date -d "${day} days ago" +%Y-%m-%d)
      else
        day=$(echo $1 | sed "s/+//")
        echo $(date -d "${day} days" +%Y-%m-%d)
      fi
    fi
  else
    echo "Usage: echodate [integer]" 1>&2
    return 1
  fi
}

#] Make a directory having date name
function mkdirdate() {
  if [ $# -eq 0 ]; then
    mkdir -v $(echodate)
  elif [ $# -eq 1 ]; then
    if echo $1 | grep -q -v "^[-+]\?[1-9][0-9]*$" ; then
      echo "Usage: mkdirdate [integer]" 1>&2
      return 1
    fi
    mkdir -v $(echodate $1)
  else
    echo "Usage: mkdirdate [integer]" 1>&2
    return 1
  fi
}

#] Change a directory to the one having date name
function cddate() {
  if [ $# -eq 0 ]; then
    cd $(echodate)
  elif [ $# -eq 1 ]; then
    if echo $1 | grep -q -v "^[-+]\?[1-9][0-9]*$" ; then
      echo "Usage: cddate [integer]" 1>&2
      return 1
    fi
    cd $(echodate $1)
  else
    echo "Usage: cddate [integer]" 1>&2
    return 1
  fi
}

#] Create a new jupyter file
function create-ipynb() {
  if [ $# -ne 1 ]; then
    echo "Error: a file name is necessary." 1>&2
    return 1
  fi
  file_name_stem=$1
  ipynb_file="$file_name_stem.ipynb"
  if [ -e $ipynb_file ]; then
    echo "Error: $ipynb_file already exists." 1>&2
    return 1
  fi
  temp_dir=$(mktemp -d)
  temp_md_file="$temp_dir/${file_name_stem}.md"
  temp_ipynb_file="$temp_dir/$ipynb_file"
  echo "#Title" > $temp_md_file
  jupytext --set-kernel - $temp_md_file
  jupytext --set-formats md:myst $temp_md_file
  jupytext --to notebook --execute $temp_md_file
  mv $temp_ipynb_file .
  rm -rf $temp_dir
}

#] Check shell.
#] These functions should be deleted at the end of this script.
function is_bash() {
  [ $(ps $$ | tail -n 1 | awk '{print $NF}' | grep 'bash') ]
}
function is_zsh() {
  [ $(ps $$ | tail -n 1 | awk '{print $NF}' | grep 'zsh') ]
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
alias grep='grep --color=auto'
alias mps='ps aux | head -n 1 ; ps aux | grep $(whoami)'
alias date8digits='date "+%Y%m%d"'
alias today='date "+%Y-%m-%d"'
if [ $(uname) = 'Darwin' ]; then
  alias ctags='`brew --prefix`/bin/ctags'
  alias sed='gsed'
fi
if is_zsh; then
  alias history="history -i -E 1"
fi


#] Setting of the path
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"


#] Change the default editor
export EDITOR=nvim


#] Setting of less command
if [ $(uname) = 'Linux' ]; then
  lesskey ~/.lesskey
  setxkbmap -option ctrl:swapcaps
  export GEM_HOME="$HOME/gems"
  export PATH="$PATH:$HOME/gems/bin"
fi

#] Setting for rbenv
[[ -d ~/.rbenv  ]] && export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"

#] Setting for pkg-config
export PKG_CONFIG_PATH="${HOME}/.local/lib/pkg-config"


#] Display matplotlib on Wezterm
export MPLBACKEND='module://matplotlib-backend-wezterm'

#] History setting
export HISTSIZE=10000
if is_zsh; then
  export SAVEHIST=$HISTSIZE
elif is_bash; then
  export HISTTIMEFORMAT='%F %T '
fi

#] Do not kill process using ctrl-D
if is_zsh; then
  setopt ignoreeof
elif is_bash; then
  export IGNOREEOF=100
fi

#] Disable beep
if is_zsh; then
  setopt no_beep
elif is_bash; then
  set bell-style none
fi

#] Complementing word in Git
if is_zsh; then
  autoload -U compinit
  compinit -u
elif is_bash; then
  if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
  fi
  if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
  fi
fi

#] To use command 'r' for the programing langauge 'R'
if is_zsh; then
  disable r
fi

#] Getting rid of a slash from WORDCHARS
if is_zsh; then
  export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
fi

unset -f is_bash
unset -f is_zsh
