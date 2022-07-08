if hash apt 2>/dev/null; then
    apt install fish
fi

if hash fish 2>/dev/null; then
    fish && exit
    ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
    ln -s ~/dotfiles/fish/conf.d ~/.config/fish/config.fish
    chsh -s /usr/bin/fish
fi
