for repo in (find ~/repos -mindepth 1 -maxdepth 1 -type d)
    complete -f -c repo -a (basename "$repo")
end
