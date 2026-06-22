let
    hide_in_width = {
        __raw = ''
            function()
                return vim.fn.winwidth(0) > 100
            end
        '';
    };

in
{
    plugins.lualine = {
        enable = true;

        settings = {
            options = {
                icons_enabled = true;

                section_separators = {
                    left = "";
                    right = "";
                };

                component_separators = {
                    left = "";
                    right = "";
                };
                disabled_filetypes = {
                    __unkeyed-1 = "alpha";
                    __unkeyed-2 = "neo-tree";
                };
                always_divide_middle = true;
            };
            sections = {
                lualine_a = [
                    {
                        __unkeyed-1 = "mode";
                        fmt = {
                            __raw = ''
                                function(str)
                                    return " " .. str
                                end
                            '';
                        };
                    }
                ];
                lualine_b = [ "branch" ];
                lualine_c = [
                    {
                        __unkeyed-1 = "filename";
                        file_status = true;
                        path = 0;
                    }
                ];
                lualine_x = [
                    {
                        __unkeyed-1 = "diagnostics";
                        sources = {
                            __unkeyed-1 = "nvim_diagnostic";
                        };
                        sections = {
                            __unkeyed-1 = "error";
                            __unkeyed-2 = "warn";
                        };
                        symbols = {
                            error = " ";
                            warn = " ";
                            info = " ";
                            hint = " ";
                        };
                        colored = false;
                        update_in_insert = false;
                        always_visible = false;
                        cond = hide_in_width;
                    }
                    {

                        __unkeyed-1 = "diff";
                        colored = false;
                        symbols = {
                            added = " ";
                            modified = " ";
                            removed = " ";
                        };
                        cond = hide_in_width;
                    }
                    {
                        __unkeyed-1 = "encoding";
                        cond = hide_in_width;
                    }
                    {
                        __unkeyed-1 = "filetype";
                        cond = hide_in_width;
                    }
                ];
                lualine_y = [ "location" ];
                lualine_z = [ "progress" ];
            };
            inactive_sections = {
                lualine_a = [ ];
                lualine_b = [ ];
                lualine_c = [
                    {
                        __unkeyed-1 = "filename";
                        path = 1;
                    }
                ];
                lualine_x = [
                    {
                        __unkeyed-1 = "location";
                        padding = 0;
                    }
                ];
                lualine_y = [ ];
                lualine_z = [ ];
            };
            tabline = { };
            extensions = [ "fugitive" ];
        };
    };
}
