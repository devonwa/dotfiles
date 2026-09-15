-- Hyprland Lua config (0.55+). Requires Hyprland >= 0.55.
-- Split host-specific config lives in ~/.config/hypr/host.lua (see `make host`).

-- HOST SETTINGS
--
-- host.lua configures monitors and defines main_monitor / side_monitor.
-- It comes from hosts/<hostname>/dots via `make host`.
local ok, host = pcall(require, "host")
if not ok then
    host = {}
end

-- PROGRAMS

local terminal    = "ghostty"
local fileManager = "nautilus"
local menu        = "rofi -show drun"

-- ENVIRONMENT

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- WORKSPACES

for i = 1, 10 do
    local rule = { workspace = i, persistent = true }
    if host.main_monitor then
        rule.monitor = host.main_monitor
    end
    hl.workspace_rule(rule)
end

hl.window_rule({ match = { initial_class = "firefox" },          workspace = 1 })
hl.window_rule({ match = { initial_class = "google-chrome" },    workspace = 1 })
hl.window_rule({ match = { initial_class = "com.mitchellh.ghostty" }, workspace = 2 })
hl.window_rule({ match = { initial_class = "dev.zed.Zed" },      workspace = 3 })
hl.window_rule({ match = { initial_class = "neovide" },          workspace = 3 })
hl.window_rule({ match = { class = "Code" },                     workspace = 3 })
hl.window_rule({ match = { initial_class = "obsidian" },         workspace = 6 })

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Make windows grouped for certain apps by default
hl.window_rule({ match = { class = "neovide" }, group = "set" })

-- AUTOSTART

hl.on("hyprland.start", function()
    hl.exec_cmd("dunst")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("waybar")

    hl.exec_cmd("google-chrome-stable")
    hl.exec_cmd("ghostty")
    hl.exec_cmd("obsidian")

    -- show this workspace on startup
    hl.dispatch(hl.dsp.focus({ workspace = 6 }))

    -- regular mouse cursor
    hl.exec_cmd("hyprctl setcursor Adwaita 24")
end)

-- LOOK & FEEL

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 0,

        border_size = 1,

        col = {
            active_border   = "rgba(00000000)",
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 8,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled  = false,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 1.0,  bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = false, speed = 0.5,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = false, speed = 0.5,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = false, speed = 0.5,  bezier = "almostLinear", style = "fade" })

-- pseudotile was removed in Hyprland 0.55
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },

    master = {
        new_status = "master",
    },
})

-- MISC

hl.config({
    misc = {
        force_default_wallpaper  = -1,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },
})

-- INPUT

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },

    binds = {
        allow_workspace_cycles   = true,
        workspace_back_and_forth = false,
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- KEYBINDS

local super = "SUPER"

hl.bind(super .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(super .. " + W",      hl.dsp.window.close())
hl.bind(super .. " + Q",      hl.dsp.exec_cmd("hyprlock"))
hl.bind(super .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(super .. " + V",      hl.dsp.window.float())
hl.bind(super .. " + space",  hl.dsp.exec_cmd(menu))
hl.bind(super .. " + P",      hl.dsp.window.pseudo())

-- Toggle Handy speech-to-text recording with Alt+Space
hl.bind("ALT + space", hl.dsp.exec_cmd("handy --toggle-transcription"))

-- Switch workspaces
hl.bind(super .. " + Tab",  hl.dsp.focus({ workspace = "previous" }))
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(super .. " + " .. key, hl.dsp.focus({ workspace = i }))
end
hl.bind(super .. " + ALT + 1", hl.dsp.focus({ workspace = 21 }))
hl.bind(super .. " + ALT + 2", hl.dsp.focus({ workspace = 22 }))
hl.bind(super .. " + ALT + 3", hl.dsp.focus({ workspace = 23 }))

-- Move workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(super .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(super .. " + SHIFT + ALT + 1", hl.dsp.window.move({ workspace = 21 }))
hl.bind(super .. " + SHIFT + ALT + 2", hl.dsp.window.move({ workspace = 22 }))
hl.bind(super .. " + SHIFT + ALT + 3", hl.dsp.window.move({ workspace = 23 }))

-- Switch windows
hl.bind(super .. " + backslash",        hl.dsp.group.next())
hl.bind(super .. " + SHIFT + backslash", hl.dsp.group.prev())
hl.bind(super .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(super .. " + down",  hl.dsp.focus({ direction = "d" }))
hl.bind(super .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(super .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(super .. " + h",     hl.dsp.focus({ direction = "l" }))
hl.bind(super .. " + j",     hl.dsp.focus({ direction = "d" }))
hl.bind(super .. " + k",     hl.dsp.focus({ direction = "u" }))
hl.bind(super .. " + l",     hl.dsp.focus({ direction = "r" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(super .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(super .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"),                           { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),                           { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Reload apps after config change
hl.bind(super .. " + SHIFT + R", hl.dsp.exec_cmd("pkill waybar && waybar"))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))