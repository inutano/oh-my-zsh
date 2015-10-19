# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

DEFAULT=$'%n@%m:%(5~,%-2~/.../%2~,%~)'
ERROR=$'%n@%m:%(5~,%-2~/.../%2~,%~)'
DEFAULT_ICON=$'\U1F423 '
ERROR_ICON=$'\U1F373 '

PROMPT=$'%(?.%{$fg_bold[yellow]%}${DEFAULT}.%{$fg_bold[red]%}${ERROR})%{$reset_color%}$(git_prompt_info) ⌚  %{\e[38;5;51m%}%*%{$reset_color%} 
%(?.${DEFAULT_ICON}.${ERROR_ICON}) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}⭠ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
