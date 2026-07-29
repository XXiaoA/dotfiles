-- Load the Lua split-monitor-workspaces module stored with these dotfiles.
local config_dir = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
package.path = package.path
    .. ";"
    .. config_dir
    .. "/hypr/plugins/split-monitor-workspaces/lua/?.lua"

local smw = require("split-monitor-workspaces")

local ipc = "noctalia msg "
local terminal = "kitty"
local file_manager = "dolphin"
local main_mod = "SUPER"

local function focus_previous_window_on_monitor()
    local monitor = hl.get_active_monitor()
    local active_window = hl.get_active_window()
    if not monitor then
        return
    end

    local candidate
    for _, window in ipairs(hl.get_windows({ monitor = monitor.id, mapped = true })) do
        if not active_window or window.address ~= active_window.address then
            if not candidate or window.focus_history_id < candidate.focus_history_id then
                candidate = window
            end
        end
    end

    if candidate then
        hl.dispatch(hl.dsp.focus({ window = candidate }))
    end
end

local function focus_next_monitor()
    local monitors = hl.get_monitors()
    local active_monitor = hl.get_active_monitor()
    if not active_monitor or #monitors < 2 then
        return
    end

    for index, monitor in ipairs(monitors) do
        if monitor.id == active_monitor.id then
            local next_monitor = monitors[index % #monitors + 1]
            -- Focusing a monitor fails when it has no window; its workspace works in both cases.
            hl.dispatch(hl.dsp.focus({ workspace = next_monitor.active_workspace }))
            hl.dispatch(hl.dsp.cursor.move({
                x = next_monitor.x + next_monitor.width / 2,
                y = next_monitor.y + next_monitor.height / 2,
            }))

            local focused_window = hl.get_active_window()
            if focused_window then
                -- Match the old script's brief dim-and-restore transition.
                hl.dispatch(hl.dsp.window.set_prop({
                    window = focused_window,
                    prop = "opacity",
                    value = "0.2 0.2 0.2 1",
                }))
                hl.timer(function()
                    hl.dispatch(hl.dsp.window.set_prop({
                        window = focused_window,
                        prop = "opacity",
                        value = "1 1 1 1",
                    }))
                end, { timeout = 80, type = "oneshot" })
            end
            return
        end
    end
end

-- External HDMI display is the origin; place the laptop panel automatically beside it.
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = "auto" })
hl.monitor({ output = "eDP-2", mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 6,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(3a94c5ee)", "rgba(35a77cee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 0,
        rounding_power = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    dwindle = { preserve_split = true },
    master = { new_status = "master" },
    misc = {
        -- Prevent the default wallpaper/logo from flashing before hyprpaper starts.
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    input = {
        -- Keep Num Lock enabled for the numeric keypad after login.
        numlock_by_default = true,
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = { natural_scroll = false },
    },
    xwayland = {
        enabled = true,
        force_zero_scaling = true,
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Keep slurp's region selector responsive by disabling its layer animation.
hl.layer_rule({
    name = "no-animation-for-slurp",
    match = { namespace = "selection" },
    no_anim = true,
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
-- Per-device sensitivity for the NearLink mouse dongle.
hl.device({ name = "compx-nearlink-mouse-dongle-1", sensitivity = 0.1 })

-- Give every monitor its own numbered 1-10 workspace set and preserve focus on reload.
smw.setup({
    workspace_count = 10,
    keep_focused = true,
})

hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + W", hl.dsp.window.kill())
hl.bind(main_mod .. " + SHIFT + ESCAPE", hl.dsp.exit())
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod .. " + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher /win"))
hl.bind(main_mod .. " + T", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"))
-- Open the first empty workspace on the focused monitor.
hl.bind(main_mod .. " + N", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center notifications"))

-- Save lossless PNG screenshots, copy them to the clipboard, and notify with a preview.
hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        [[sh -c 'REGION=$(slurp) || exit; FILE=~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png; grim -l 0 -s 1 -g "$REGION" "$FILE" && wl-copy < "$FILE" && notify-send "Screenshot taken" -t 1000 -a Screenshot -i "$FILE"']]
    )
)
hl.bind(
    "SHIFT + Print",
    hl.dsp.exec_cmd(
        [[sh -c 'FILE=~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png; grim -l 0 -s 1 "$FILE" && wl-copy < "$FILE" && notify-send "Screenshot taken" -t 1000 -a Screenshot -i "$FILE"']]
    )
)
hl.bind(main_mod .. " + SHIFT + R", hl.dsp.exec_cmd("~/dotfiles/scripts/recorder"))

-- Alt-Tab selects the least recently focused window on the current monitor.
hl.bind("ALT + TAB", focus_previous_window_on_monitor)
hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Workspace numbers and moved windows are resolved within the focused monitor's set.
for i = 1, smw.get_amount_of_workspaces() do
    local key = tostring(i % 10)
    hl.bind(main_mod .. " + " .. key, smw.workspace(tostring(i)))
    hl.bind(main_mod .. " + SHIFT + " .. key, smw.move_to_workspace_silent(tostring(i)))
end

-- Return to the previous workspace in the current monitor's workspace set.
hl.bind(main_mod .. " + TAB", smw.workspace("prev"))
hl.bind(main_mod .. " + BRACKETLEFT", smw.workspace("-1"))
hl.bind(main_mod .. " + BRACKETRIGHT", smw.workspace("+1"))
hl.bind(main_mod .. " + mouse_down", smw.cycle_workspaces("next"))
hl.bind(main_mod .. " + mouse_up", smw.cycle_workspaces("prev"))
-- Focus the next monitor, warp to its center, and briefly dim its active window.
hl.bind(main_mod .. " + SHIFT + BRACKETRIGHT", focus_next_monitor)

hl.bind(main_mod .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(main_mod .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(main_mod .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(main_mod .. " + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Prevent application maximize requests from changing the tiled layout.
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
-- Avoid focus-stealing ghost windows during XWayland drag operations.
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
-- Matplotlib and imv are utility windows: open them floating and centered.
hl.window_rule({
    name = "float-matplotlib",
    match = { class = "^(Matplotlib)$" },
    float = true,
    center = true,
})
hl.window_rule({ name = "float-imv", match = { class = "^(imv)$" }, float = true, center = true })

-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.bind(main_mod .. "+ Comma", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(main_mod .. " + Period", hl.dsp.exec_cmd(ipc .. "settings-toggle"))

-- Start the session services previously launched through exec-once directives.
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("mihomo")
    hl.exec_cmd("keymapper")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("syncthing")
    hl.exec_cmd([[sh -c 'echo "Xft.dpi: 144" | xrdb -merge']])
    hl.exec_cmd("noctalia")
end)
