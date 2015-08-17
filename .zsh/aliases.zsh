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
alias ggpush='git push'
alias ggpull='git pull'
alias bx='bundle exec'

# simple webserver
alias srv='python -m SimpleHTTPServer 8888'

# my aliases
alias cleardupes='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias flushdns='sudo discoveryutil udnsflushcaches'
alias vundle='vim +BundleInstall +qall'

# start up docker compost
alias dcs='docker-compose start'

# gorce that shit
alias pretty_gource='gource --hide mouse,bloom,dirnames,date,filenames,usernames --user-image-dir .git/avatar/ --auto-skip-seconds 1'
