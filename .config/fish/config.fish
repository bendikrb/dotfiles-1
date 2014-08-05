set -U EDITOR vim

# disable greeting
set fish_greeting ""

set NODE_PATH "/usr/local/lib/node_modules"
set PATH "$EC2_HOME/bin" $PATH
set PATH ".bundle/bin" $PATH
set PATH "/usr/local/bin" $PATH
set PATH "/usr/local/sbin" $PATH
set PATH "/usr/local/share/npm/bin" $PATH
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH $HOME/bin $PATH

set ANDROID_HOME /Applications/Android\ Studio.app/sdk

rbenv rehash >/dev/null ^&1

. ~/.config/fish/z.fish

set fish_git_dirty_color red

function parse_git_dirty
  git diff --quiet HEAD ^&-
  if test $status = 1
    echo (set_color $fish_git_dirty_color)"Δ"(set_color normal)
  end
end

function __fish_git_untracked_file_count
  set -l uncomitted (git status --porcelain 2>/dev/null| grep "^M" | wc -l)
  set -l not_added  (git status --porcelain 2>/dev/null| grep "^ M" | wc -l)
  set -l count (git status --porcelain 2>/dev/null| grep "^??" | wc -l)
  echo $uncommitted $not_added $count
end

function parse_git_branch
  # git branch outputs lines, the current branch is prefixed with a *
  set -l branch (git branch --color ^&- | awk '/*/ {print $2}')
  echo $branch
end

function __fish_git_in_working_tree
  [ "true" = (git rev-parse --is-inside-work-tree ^ /dev/null; or echo false) ]
end

function __fish_git_dirty
  not git diff --no-ext-diff --quiet --exit-code ^ /dev/null
  or not git diff-index --cached --quiet HEAD ^ /dev/null
  or count (git ls-files --others --exclude-standard) > /dev/null
end

function __fish_git_current_head
  git symbolic-ref HEAD ^ /dev/null
  or git describe --contains --all HEAD
end

function __fish_git_current_branch
  __fish_git_current_head | sed -e "s#^refs/heads/##"
end

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)

function git_prompt
  if test -z (git branch -quiet 2>| awk '/fatal:/ {print "no git"}')
    printf '%s git%s ↝' (set_color yellow) (set_color normal)
    printf '%s %s %s %s %s' (set_color yellow) (__fish_git_current_branch) (parse_git_dirty) (set_color normal)
  end
end

function hg_prompt
  printf (set_color magenta)
  hg prompt ' hg ↝ {[+{incoming|count}]-->}{branch}{-->[+{outgoing|count}]}{ at {bookmark}}{status}' 2> /dev/null
  printf (set_color normal)
end

function exit_code_prompt
  if not [ $status = '0' ]
    printf '%s(ノಠ益ಠ)ノ彡┻━┻%s' (set_color red) (set_color normal)
  end
end

function fish_prompt
  exit_code_prompt
  z --add "$PWD"
  echo

  printf '╭─%s%s%s' (set_color cyan) (whoami) (set_color normal)
  printf '@'
  printf '%s%s%s' (set_color cyan) (hostname|cut -d . -f 1) (set_color normal)

  printf ' '

  printf '%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)

  git_prompt
  hg_prompt

  printf '%s\n╰─'

  festive_prompt
  printf (set_color normal)
end

# Directories
alias ..    'cd ..'
alias ...   'cd ../..'
alias ....  'cd ../../..'
alias ..... 'cd ../../../..'
alias md 'mkdir -p'

# git aliases
alias gc  'git checkout'
alias gd  'git diff'
alias gdc 'git diff --cached'
alias gs  'git status'
alias gpr 'git pull --rebase'
alias gl 'git log --graph --abbrev-commit --decorate --format=format:\'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n\'\'          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)\' --all'
alias gprp 'git pull --rebase ; git push'
alias gpu 'git push -u origin'
alias ggpush 'git push origin (__fish_git_current_branch)'
alias ggpull 'git pull origin (__fish_git_current_branch)'
alias ∆ 'git diff'
alias π 'git pull --rebase ; git push'
alias binstubs 'bundle install --binstubs'
alias bx 'bundle exec'
alias bxr 'bundle exec rake'

alias srv 'python -m SimpleHTTPServer 8888'

# Vagrant aliases
alias vu 'vagrant up'
alias vd 'vagrant destroy'
alias vp 'vagrant provision'

# my aliases
alias cleardupes '/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias flushdns 'dscacheutil -flushcache'
alias vundle 'vim +BundleInstall +qall'
# Todo.sh
alias t 'todo.sh'

if not contains 'T' $TMUX
# eval 'tmux ls | grep -v attached; and tmux at; or tmux'
end

eval 'ssh-add ~/.ssh/id_rsa'
