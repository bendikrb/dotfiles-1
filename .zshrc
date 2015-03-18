# run inside tmux
if [ "$TMUX" = "" ]; then tmux; fi

autoload -U colors && colors
autoload -Uz vcs_info
autoload -U compinit && compinit
zmodload -i zsh/complist

# version control code
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats "%s ↝ %b %m%u%c "
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
precmd() {
  psvar=()
  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}

source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/fasd.zsh"
source "$HOME/.zsh/keys.zsh"

setopt prompt_subst
PS1="$fg[red]%(?,,(ノಠ益ಠ%)ノ彡┻━┻
)$reset_color╭─$fg[cyan]%n$reset_color@$fg[cyan]%m$reset_color $fg[green]%~$reset_color $fg[yellow]%1v$reset_color
╰─ॐ  "

fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions ~/.zsh $fpath)