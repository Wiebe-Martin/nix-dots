{
    plugins.luasnip.enable = true;

    plugins.blink-cmp = {
        enable = true;

        settings = {
            keymap = {
                preset = "default";
            };

            appearance.nerd_font_variant = "mono";
        };

        completion = {
            documentation = {
                auto_show = false;
                auto_show_delay_ms = 500;
            };
        };

        sources = {
            default = [
                "lsp"
                "path"
                "snippets"
                "lazydev"
            ];
            providers = {
                lazydev = {
                    module = "lazydev.integrations.blink";
                    score_offset = 100;
                };
            };
        };

        snippets = {
            preset = "luasnip";
        };

        # Blink.cmp includes an optional, recommended rust fuzzy matcher,
        # which automatically downloads a prebuilt binary when enabled.

        # By default, we use the Lua implementation instead, but you may enable
        # the rust implementation via `'prefer_rust_with_warning'`

        # See :h blink-cmp-config-fuzzy for more information
        # fuzzy = { implementation = "lua" },
        fuzzy = {
            implementation = "prefer_rust_with_warning";
        };

        # Shows a signature help window while you type arguments for a function
        signature = {
            enabled = true;
        };
    };
}
