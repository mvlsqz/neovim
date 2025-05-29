function git-clean-local -d "Clean up local branches that not longer exist on remote"
    git branch -vv | grep 'gone]' | awk '{print $1}' | xargs git branch -D
end
