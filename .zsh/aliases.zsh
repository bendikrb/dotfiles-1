# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# git aliases
alias gc='git checkout'
alias gd='git diff'
alias gs='git status'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias ggpush='git push origin (__fish_git_current_branch)'
alias ggpull='git pull origin (__fish_git_current_branch)'
alias bx='bundle exec'

alias srv='python -m SimpleHTTPServer 8888'

# my aliases
alias cleardupes='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias flushdns='sudo discoveryutil udnsflushcaches'
alias vundle='vim +BundleInstall +qall'
