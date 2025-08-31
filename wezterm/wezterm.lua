---@diagnostic disable: unused-local
local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

local function modify_colorscheme(colorscheme)
    local file_path = os.getenv("HOME") .. "/.config/wezterm/wezterm.lua"
    local _f = assert(io.open(file_path, "r"))
    local data = _f:read("*a")
    _f:close()

    local f = assert(io.open(file_path, "w"))
    data = data:gsub(
        'local color_scheme = "[^%%]-"',
        ('local color_scheme = "%s"'):format(colorscheme)
    )
    f:write(data)
    f:close()
end

wezterm.on("user-var-changed", function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "Nvim_Colorscheme" then
        overrides.color_scheme = value
        modify_colorscheme(value)
    end
    window:set_config_overrides(overrides)
end)

local color_scheme = "Everforest"

wezterm.on("update-right-status", function(window, pane)
    local leader = ""
    if window:leader_is_active() then
        leader = "🤔"
    end
    window:set_right_status(leader)
end)

config = {
    font = wezterm.font_with_fallback({
        {
            family = "Maple Mono",
            harfbuzz_features = {
                "cv01=1",
                "ss01=1",
                "ss02=1",
                "ss03=1",
                "ss04=1",
                "ss05=1",
            },
        },
        { family = "Symbols Nerd Font Mono", scale = 0.80 },
        "Maple Mono SC NF", -- for Chinese
        "Noto Color Emoji",
        "JetBrains Mono",

        -- icons
        "Font Awesome 6 Pro Solid",
        "Material Design Icons Desktop",
        "MesloLGSDZ Nerd Font Mono",
        "feather",
    }),
    font_size = 13.5,
    allow_square_glyphs_to_overflow_width = "Never",

    color_scheme = color_scheme,

    -- default_prog = { "/bin/bash", "-l", "-c", "tmux attach || tmux" },

    window_padding = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 0,
    },
    window_background_opacity = 0.95,
    window_decorations = "RESIZE",
    window_close_confirmation = "NeverPrompt",

    enable_tab_bar = true,
    use_fancy_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = false,

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

    disable_default_key_bindings = true,
    -- leader = { key = "z", mods = "CTRL", timeout_milliseconds = 2000 },
    keys = {
        -- stylua: ignore start
        { mods = 'LEADER', key = '0', action = wezterm.action.PaneSelect { mode = 'SwapWithActive' } },
        { key = ",", mods = "LEADER",
            action = act.PromptInputLine({
                description = "Enter new name for tab",
                action = wezterm.action_callback(function(window, pane, line)
                    if line then
                        window:active_tab():set_title(line)
                    end
                end),
            }),
        },
        { key = "\\", mods = "LEADER", action = act.SplitPane({ direction = "Right" }) },
        { key = "-", mods = "LEADER", action = act.SplitPane({ direction = "Down" }) },
        { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
        { key = "w", mods = "LEADER", action = act.ShowTabNavigator },
        { key = "l", mods = "LEADER", action = act.ActivateTabRelative(1) },
        { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
        { key = "v", mods = "LEADER", action = act.ActivateCopyMode },
        { key = "r", mods = "LEADER", action = act.ReloadConfiguration },
        { key = "1", mods = "LEADER", action = act({ ActivateTab = 0 }) },
        { key = "2", mods = "LEADER", action = act({ ActivateTab = 1 }) },
        { key = "3", mods = "LEADER", action = act({ ActivateTab = 2 }) },
        { key = "4", mods = "LEADER", action = act({ ActivateTab = 3 }) },
        { key = "5", mods = "LEADER", action = act({ ActivateTab = 4 }) },
        { key = "6", mods = "LEADER", action = act({ ActivateTab = 5 }) },
        { key = "7", mods = "LEADER", action = act({ ActivateTab = 6 }) },
        { key = "8", mods = "LEADER", action = act({ ActivateTab = 7 }) },
        { key = "9", mods = "LEADER", action = act({ ActivateTab = 8 }) },
        { key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },

        { key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
        { key = "Enter", mods = "SHIFT", action = act.SendString("\x1b[13;2u") },
        { key = "0", mods = "CTRL", action = act.ResetFontSize },
        { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
        { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
        { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
        { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
        -- stylua: ignore end
    },
}

local is_win = wezterm.target_triple:find("window") ~= nil
if is_win then
    config.default_domain = "WSL:Ubuntu"
    config.hide_tab_bar_if_only_one_tab = false
end

return config
