{
    plugins.luasnip.enable = true;
    # plugins.blink-cmp-spell.enable = true;

    plugins.blink-cmp = {
        enable = true;

        settings = {
            keymap = {
                preset = "default";
            };

            appearance.nerd_font_variant = "mono";

            completion = {
                documentation = {
                    auto_show = false;
                    auto_show_delay_ms = 500;
                    window = {
                        border = "single";
                    };
                };
                menu = {
                    winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
                    border = "single";
                };
            };

            sources = {
                default = [
                    "lsp"
                    "path"
                    "snippets"
                    "buffer"
                    # "lazydev"
                    # "spell"
                ];
                providers = {
                    # lazydev = {
                    #     module = "lazydev.integrations.blink";
                    #     score_offset = 100;
                    # };
                    # spell = {
                    #       module = "blink-cmp-spell";
                    #       name = "Spell";
                    #       score_offset = 100;
                    #       opts = { };
                    #   };
                    #   spell.__raw = ''
                    #       {
                    #           enabled = function()
                    #               local bufnr = vim.fn.bufnr()
                    #               local enabled = spell_cache[bufnr]
                    #               if type(enabled) ~= 'boolean' then
                    #                   enabled = not vim.list_contains(vim.opt_local.spelllang:get(), 'de')
                    #                   spell_cache[bufnr] = enabled
                    #               end
                    #               return enabled
                    #           end,
                    #       },
                    #   '';
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
                window = {
                    border = "single";
                };
            };
        };
    };
}
