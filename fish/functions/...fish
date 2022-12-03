function .. -a num -d "Change directory to the nth parent directory"
    if test -n "$num"
        set path (string repeat -n "$num" "../")
    else
        set path "../"
    end
    cd "$path"
end
