local wezterm = require("wezterm")

return {
    -- You can specify some parameters to influence the font selection;
    -- for example, this selects a Bold, Italic font variant.
    -- font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true }),
    font = wezterm.font("JetBrains Mono"),
    font_size = 13.0,
    color_scheme = "Gruvbox Dark",
    keys = {
        {
            key = "F11",
            action = wezterm.action.ToggleFullScreen,
        },
    },
}
