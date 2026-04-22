{
    plugins.oil = {
        enable = true;

        settings = {
            columns = [
                "icon"
            ];
            view_options = {
                show_hidden = true;
            };
        };
    };

    keymaps = [
        {
            mode = "n";
            key = "<leader>mo";
            action = "<cmd>Oil --preview<CR>";
            options = {
                desc = "Open oil.nvim file explorer";
                noremap = true;
                silent = true;
            };
        }
    ];
}
