{
    plugins.lsp = {
        enable = true;
        servers = {
            nil_ls = {
                enable = true;
            };

            pylsp = {
                enable = true;
                settings = {
                    plugins = {
                        pyflakes = {
                            enabled = true;
                        };
                        pycodestyle = {
                            enabled = true;
                        };
                        autopep8 = {
                            enabled = false;
                        };
                        yapf = {
                            enabled = false;
                        };
                        mccabe = {
                            enabled = true;
                        };
                        pylsp_mypy = {
                            enabled = true;
                        };
                        pylsp_black = {
                            enabled = true;
                        };
                        pylsp_isort = {
                            enabled = true;
                        };
                        rope_autoimport = {
                            enabled = true;
                            memory = true;
                            fuzzy = false;
                            projectRoot.__raw = ''
                                vim.fn.getcwd();
                            '';
                            maxFiles = 1000;
                        };
                    };
                };
            };

            tinymist = {
                enable = true;
                settings = {
                    exportPdf = "onSave";
                };
            };
        };

        onAttach = ''
            local map = function(keys, func, desc, mode)
                mode = mode or "n"
                vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
            end

            -- Rename
            map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

            -- Code actions
            map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client:supports_method("textDocument/documentHighlight", event.buf) then
                local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references,
                })

                vim.api.nvim_create_autocmd("LspDetach", {
                    group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                    callback = function(event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                    end,
                })
            end

            -- Inlay hints toggle
            if client and client:supports_method("textDocument/inlayHint", event.buf) then
                map("<leader>th", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                end, "[T]oggle Inlay [H]ints")
            end
        '';
    };
}
