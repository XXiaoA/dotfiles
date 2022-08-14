local wezterm = require("wezterm")

local scheme = wezterm.get_builtin_color_schemes()["Andromeda"]
scheme.cursor_bg = "#8f3f71"
scheme.cursor_fg = "black"

return {
    font = wezterm.font({
        family = "JetBrainsMono Nerd Font",
        harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    }),

    font_size = 16,

    color_schemes = {
        ["Andromeda"] = scheme,
    },
    color_scheme = "Andromeda",

    window_background_opacity = 0.95,
    window_decorations = "RESIZE",
    window_close_confirmation = "NeverPrompt",

    enable_tab_bar = false,

    cursor_blink_ease_in = "Constant",
    cursor_blink_ease_out = "Constant",

    keys = {
        {
            key = "F11",
            action = wezterm.action.ToggleFullScreen,
        },
    },
}
