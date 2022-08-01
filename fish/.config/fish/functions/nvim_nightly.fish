function nvim_nightly --description "Neovim Nightly"
    set --local DOWNLOAD_PATH $HOME/.apps/nvim_nightly/nvim.appimage
    switch $argv[1]
        case --update
            if not test -d $HOME/.apps/nvim_nightly
                mkdir -p $HOME/.apps/nvim_nightly
            end
            wget -x https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O $DOWNLOAD_PATH
            chmod u+x $DOWNLOAD_PATH
        case "*"
            if test -e $DOWNLOAD_PATH
                $DOWNLOAD_PATH $argv
            else
                echo "Please run the command after running 'nvim_nightly --update'"
            end
    end
end