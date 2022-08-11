function rm --description Remove
    if command -sq trash-put
        echo "You're using trash-cli" && trash-put $argv && echo "Removed $argv"
    else
        echo "Please use trash-cli" && rm $argv && echo "Removed $argv"
    end
end
