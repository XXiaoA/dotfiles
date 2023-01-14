function rm --description Remove
    if command -sq trash-put
        echo "You're using trash-cli" && trash-put $argv && echo "Removed $argv"
    else
        set_color red; echo "Please use trash-cli"
        set_color normal
        /usr/bin/rm $argv && echo "Removed $argv"
    end
end
