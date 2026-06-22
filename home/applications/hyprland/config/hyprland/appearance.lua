local primary = "rgb(a8b665)"
local outline = "rgb(a89984)"
local error = "rgb(e96962)"

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
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
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
            border_locked_active = error,
            border_locked_inactive = outline,
        },

        groupbar = {
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
        force_default_wallpaper = 1,
        disable_hyprland_logo = true,
    },
})
