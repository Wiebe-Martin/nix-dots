{
    plugins = {
        which-key.enable = true;
        nvim-autopairs.enable = true;
        render-markdown.enable = true;
        todo-comments.enable = true;
        colorizer.enable = true;
        rainbow-delimiters.enable = true;
        noice = {
            enable = true;
            settings = {
                cmdline.enabled = true;
                presets = {
                    # bottom_search = true;
                    command_palette = true;
                    long_message_to_split = true;
                    inc_rename = false;
                    lsp_doc_border = false;
                };
                lsp.override = {
                    "cmp.entry.get_documentation" = false;
                    "vim.lsp.util.convert_input_to_markdown_lines" = false;
                    "vim.lsp.util.stylize_markdown" = false;
                };
            };
        };
        undotree = {
            enable = true;
            settings.keymaps = [
                {
                    mode = "n";
                    key = "<leader>ut";
                    action.__raw = ''
                        vim.cmd.UndotreeToggle
                    '';
                }
            ];
        };
    };
}
