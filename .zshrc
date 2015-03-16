autoload -U colors && colors
autoload -Uz vcs_info

# version control code
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%s ↝ %b %m%u%c"
precmd() {
  psvar=()

  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}

source "$HOME/.zsh/aliases.zsh"

setopt prompt_subst
PS1="╭─$fg[cyan]%n$reset_color@$fg[cyan]%m$reset_color $fg[green]%~$reset_color $fg[yellow]%1v$reset_color
╰─ॐ  "