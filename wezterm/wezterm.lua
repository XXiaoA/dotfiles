local wezterm = require("wezterm")

local scheme = wezterm.get_builtin_color_schemes()["Andromeda"]
scheme.cursor_bg = "#8f3f71"
scheme.cursor_fg = "black"

wezterm.on("toggle-ligature", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.harfbuzz_features then
        -- If we haven't overridden it yet, then override with ligatures disabled
        overrides.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
    else
        -- else we did already, and we should disable out override now
        overrides.harfbuzz_features = nil
    end
    window:set_config_overrides(overrides)
end)

return {
    font = wezterm.font({
        family = "JetBrainsMono Nerd Font",
        -- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
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

    hyperlink_rules = {
        -- Linkify things that look like URLs
        -- This is actually the default if you don't specify any hyperlink_rules
        {
            regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
            format = "$0",
        },
        -- match the URL with a PORT
        -- such 'http://localhost:3000/index.html'
        {
            regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
            format = "$0",
        },
        -- linkify email addresses
        {
            regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
            format = "mailto:$0",
        },
        -- file:// URI
        {
            regex = "\\bfile://\\S*\\b",
            format = "$0",
        },
    },

    keys = {
        { key = "Tab", mods = "CTRL", action = wezterm.action({ ActivateTabRelative = 1 }) },
        {
            key = "Tab",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ ActivateTabRelative = -1 }),
        },
        { key = "Enter", mods = "ALT", action = "ToggleFullScreen" },
        { key = "F11", mods = "CTRL|SHIFT", action = "ToggleFullScreen" },
        {
            key = "E",
            mods = "CTRL",
            action = wezterm.action.EmitEvent("toggle-ligature"),
        },
    },
}
