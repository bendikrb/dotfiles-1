autoload -U colors && colors
autoload -Uz vcs_info


# version control code
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats "%s ↝ %b %m%u%c"
precmd() {
  psvar=()
  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[2]="$vcs_info_msg_0_"
}

source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/keys.zsh"
source "$HOME/.zsh/fasd.zsh"

setopt prompt_subst
PS1="$fg[red]%(?,,(ノಠ益ಠ%)ノ彡┻━┻
)$reset_color╭─$fg[cyan]%n$reset_color@$fg[cyan]%m$reset_color $fg[green]%~$reset_color $fg[yellow]%2v$reset_color
╰─ॐ  "