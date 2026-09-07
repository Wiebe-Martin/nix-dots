-- Colors come from the active stylix scheme via the generated colors.lua
-- (see home/applications/hyprland/hyprland.nix). Mapping mirrors stylix's
-- own Hyprland target.
local colors = require("hyprland/colors")

local primary = "rgb(" .. colors.base0D .. ")"
local outline = "rgb(" .. colors.base03 .. ")"
local locked = "rgb(" .. colors.base0C .. ")"
local error = "rgb(" .. colors.base08 .. ")"
local text = "rgb(" .. colors.base05 .. ")"

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border = primary,
            inactive_border = outline,
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 0,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(" .. colors.base00 .. "99)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.config({
    group = {
        col = {
            border_active = primary,
            border_inactive = outline,
            border_locked_active = locked,
            border_locked_inactive = outline,
        },

        groupbar = {
            text_color = text,

            col = {
                active = primary,
                inactive = outline,
                locked_active = error,
                locked_inactive = outline,
            },
        },
    },
})

hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        background_color = "rgb(" .. colors.base00 .. ")",
        force_default_wallpaper = 1,
        disable_hyprland_logo = true,
    },
})
