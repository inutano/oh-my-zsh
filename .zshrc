# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="inutano"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Configure PATH before loading plugins
export PATH=$HOME/local/bin:/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/opt:local/sbin:/usr/local/sbin:/usr/sbin:/sbin
# export MANPATH="/usr/local/man:$MANPATH"

# Configure PATH for gridengine
[ -d /home/geadmin/UGER/bin/lx-amd64 ] && export PATH="/home/geadmin/UGER/bin/lx-amd64/:$PATH"

# configuration for boxen
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
[ -f /opt/boxen/nvm/nvm.sh ] && source /opt/boxen/nvm/nvm.sh

# configuration for rbenv
[ -d $HOME/.rbenv/bin ] && export PATH="$HOME/.rbenv/bin:$PATH"
[ -f $HOME/.rbenv/bin/rbenv ] && eval "$(rbenv init -)"

# configuration for pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby osx bundler brew emoji-clock vagrant tmux docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

case ${OSTYPE} in
  darwin*)
    alias ls='gls -F --color=auto'
    ;;
esac

alias x='exit'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias dirs='dirs -v'
alias n='nano -x'
alias nv='nano -xv'
alias tawk='awk -F "\t"'

# functions
header(){
  local input_file=$1
  cat "${input_file}" |\
  head -1 |\
  tr '\t' '\n' |\
  awk '{ print NR " " $0 }'
}

# alias for local build tmux
tmux_lib_path="${HOME}/local/src/tmux-1.9a/libevent-2.0.21-stable/build/lib"
local_tmux_bin="${HOME}/local/bin/tmux"
if [ -d $tmux_lib_path ] && [ -f $local_tmux_bin ] ; then
  alias tmux='LD_LIBRARY_PATH=$tmux_lib_path $local_tmux_bin'
fi

# History Search
autoload -U  up-line-or-beginning-search
zle      -N  up-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search

autoload -U  down-line-or-beginning-search
zle      -N  down-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

# zsh-notify
if [ -e $HOME/.zsh.d/zsh-notify ] ; then
  autoload -U add-zsh-hook
  source ~/.zsh.d/zsh-notify/notify.plugin.zsh
  export SYS_NOTIFIER="/opt/boxen/homebrew/bin/terminal-notifier"
  export NOTIFY_COMMAND_COMPLETE_TIMEOUT=17
fi

# ls colors
if [ -f ~/.dircolors ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors ~/.dircolors)
  fi
fi

# old network commands deprecator
net_tools_deprecated_message () {
  echo -n 'I said you do not use net-tools commands, okay?'
}
arp () {
  net_tools_deprecated_message
  echo 'Use `ip n`'
}
ifconfig () {
  net_tools_deprecated_message
  echo 'Use `ip a`, `ip link`, `ip -s link`'
}
iptunnel () {
  net_tools_deprecated_message
  echo 'Use `ip tunnel`'
}
iwconfig () {
  echo -n 'I said you do not use iwconfig commands, okay?'
  echo 'Use `iw`'
}
nameif () {
  net_tools_deprecated_message
  echo 'Use `ip link`, `ifrename`'
}
netstat () {
  net_tools_deprecated_message
  echo 'Use `ss`, `ip route` (for netstat -r), `ip -s link` (for netstat -i), `ip maddr` (for netstat -g)'
}
route () {
  net_tools_deprecated_message
  echo 'Use `ip r`'
}
