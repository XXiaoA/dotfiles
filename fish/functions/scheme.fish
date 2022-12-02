function scheme --description "change the colorschemes"
    switch $argv[1]
        case duskfox
            # Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/duskfox/nightfox_fish.fish
            set -l foreground e0def4
            set -l selection 433c59
            set -l comment 817c9c
            set -l red eb6f92
            set -l orange ea9a97
            set -l yellow f6c177
            set -l green a3be8c
            set -l purple c4a7e7
            set -l cyan 9ccfd8
            set -l pink eb98c3

            # Syntax Highlighting Colors
            set -g fish_color_normal $foreground
            set -g fish_color_command $cyan
            set -g fish_color_keyword $pink
            set -g fish_color_quote $yellow
            set -g fish_color_redirection $foreground
            set -g fish_color_end $orange
            set -g fish_color_error $red
            set -g fish_color_param $purple
            set -g fish_color_comment $comment
            set -g fish_color_selection --background=$selection
            set -g fish_color_search_match --background=$selection
            set -g fish_color_operator $green
            set -g fish_color_escape $pink
            set -g fish_color_autosuggestion $comment

            # Completion Pager Colors
            set -g fish_pager_color_progress $comment
            set -g fish_pager_color_prefix $cyan
            set -g fish_pager_color_completion $foreground
            set -g fish_pager_color_description $comment
        case nightfox
            # Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_fish.fish
            set -l foreground cdcecf
            set -l selection 2b3b51
            set -l comment 738091
            set -l red c94f6d
            set -l orange f4a261
            set -l yellow dbc074
            set -l green 81b29a
            set -l purple 9d79d6
            set -l cyan 63cdcf
            set -l pink d67ad2

            # Syntax Highlighting Colors
            set -g fish_color_normal $foreground
            set -g fish_color_command $cyan
            set -g fish_color_keyword $pink
            set -g fish_color_quote $yellow
            set -g fish_color_redirection $foreground
            set -g fish_color_end $orange
            set -g fish_color_error $red
            set -g fish_color_param $purple
            set -g fish_color_comment $comment
            set -g fish_color_selection --background=$selection
            set -g fish_color_search_match --background=$selection
            set -g fish_color_operator $green
            set -g fish_color_escape $pink
            set -g fish_color_autosuggestion $comment

            # Completion Pager Colors
            set -g fish_pager_color_progress $comment
            set -g fish_pager_color_prefix $cyan
            set -g fish_pager_color_completion $foreground
            set -g fish_pager_color_description $comment
        case gruvbox
            # https://github.com/sujaybokil/fish-gruvbox/blob/5556465864fdc0ad69c6bec47e730be02ff984a5/conf.d/gruvbox.fish
            # Dracula Color Palette
            set -l foreground ebdbb2
            set -l selection 504945
            set -l comment 8f3f71
            set -l red fb4934
            set -l orange fe8019
            set -l yellow fabd2f
            set -l green b8bb26
            set -l purple d3869b
            set -l cyan 8ec07c
            set -l blue 83a598

            # Syntax Highlighting Colors
            set -g fish_color_normal $foreground
            set -g fish_color_command $cyan
            set -g fish_color_keyword $blue
            set -g fish_color_quote $yellow
            set -g fish_color_redirection $foreground
            set -g fish_color_end $orange
            set -g fish_color_error $red
            set -g fish_color_param $purple
            set -g fish_color_comment $comment
            set -g fish_color_selection --background=$selection
            set -g fish_color_search_match --background=$selection
            set -g fish_color_operator $green
            set -g fish_color_escape $blue
            set -g fish_color_autosuggestion $comment

            # Completion Pager Colors
            set -g fish_pager_color_progress $comment
            set -g fish_pager_color_prefix $cyan
            set -g fish_pager_color_completion $foreground
            set -g fish_pager_color_description $comment
        case '*'
            echo "unknown colorscheme '$argv[1]'"
    end
end
