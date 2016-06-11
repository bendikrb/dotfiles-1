# run inside tmux
export PATH="/usr/local/bin:$HOME/.rbenv/bin:$PATH:/usr/local/CrossPack-AVR/bin"
if [ "$TMUX" = "" ]; then
  UNATTACHED=$(tmux list-sessions | grep -v attached | head -n 1 | awk -F ':' '{print $1}')
  if [ "$UNATTACHED" -ne "" ]; then
    tmux attach
  else
    tmux
  fi
fi

autoload -U colors && colors
autoload -Uz vcs_info
autoload -U compinit && compinit
zmodload -i zsh/complist

# version control code
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats "%{$fg[yellow]%}%s %{$reset_color%}↝ %{$fg[yellow]%}%b %{$fg[red]%}%m%u%c%{$reset_color%} "
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr '😎 '
zstyle ':vcs_info:*' unstagedstr '😱 '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
### git: Show marker (T) if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c
function +vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | fgrep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[unstaged]+='😡 '
    fi
}
precmd() {
  vcs_info
}

files=("aliases" "completion" "fasd" "history" "keys" "rito")
for file in $files; do
  source "$HOME/.zsh/$file.zsh"
done

setopt prompt_subst
PROMPT='$fg[red]%(?..(ノಠ益ಠ%)ノ彡┻━┻
)$reset_color╭─$fg[cyan]%n$reset_color@$fg[cyan]%m$reset_color $fg[green]%~$reset_color ${vcs_info_msg_0_}
╰─ॐ  '

fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions ~/.zsh $fpath)

# rbenv work
eval "$(rbenv init -)"


export EDITOR=vim

# ssh-agent forwarding
[ -f ~/.ssh/id_rsa ] && ssh-add ~/.ssh/id_rsa 2> /dev/null

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# configure docker
if type 'docker-machine' > /dev/null; then
  if [[ $(docker-machine status default) == 'Running' ]];
  then
    eval "$(docker-machine env default)"
    export DOCKER_IP=$(docker-machine ip default)
  fi
  export JAVA_HOME=`/usr/libexec/java_home`
fi

