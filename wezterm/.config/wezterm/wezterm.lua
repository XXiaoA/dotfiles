local wt = require("wezterm")

local scheme = wt.get_builtin_color_schemes()["Andromeda"]
scheme.cursor_bg = "#8f3f71"
scheme.cursor_fg = "black"

return {
    enable_tab_bar = false,
    font = wt.font("JetBrainsMono Nerd Font"),
    font_size = 16,
    color_schemes = {
        ["Andromeda"] = scheme,
    },
    color_scheme = "Andromeda",
    custom_block_glyphs = true,
    window_decorations = "RESIZE",
    window_close_confirmation = "NeverPrompt",
    cursor_blink_ease_in = "Constant",
    cursor_blink_ease_out = "Constant",

    keys = {
        {
            key = "F11",
            action = wt.action.ToggleFullScreen,
        },
    },
}
