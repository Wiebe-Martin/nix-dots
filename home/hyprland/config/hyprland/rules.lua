hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

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

-- hl.window_rule({
--     name = "protonvpn-app",
--     match = {
--         namespace = "^(protonvpn-app)$",
--     },
--
--     float = true,
--     center = true,
--     size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
-- })

hl.layer_rule({
    name = "no-anim-overlay",
    match = { namespace = "^dms$" },
    no_anim = true,
})

hl.config({
    general = {
        allow_tearing = true,
    },
})

hl.window_rule({
    match = { class = "cs2" },
    immediate = true,
})
