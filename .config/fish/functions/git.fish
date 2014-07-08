function ggpush
  git push origin (__fish_git_current_branch)
end
function ggpull
  git pull origin (__fish_git_current_branch)
end
function gc
  git checkout $argv
end
