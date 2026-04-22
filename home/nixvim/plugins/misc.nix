{
    plugins = {
        which-key.enable = true;
        nvim-autopairs.enable = true;
        render-markdown.enable = true;
        todo-comments.enable = true;
        undotree = {
            enable = true;
            keymaps = [
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
