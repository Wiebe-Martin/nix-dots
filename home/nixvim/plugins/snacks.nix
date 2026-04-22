{
    plugins.snacks = {
        enable = true;

        settings = {
            picker = {
                enabled = true;
            };
            explorer = {
                enabled = true;
            };
        };
    };

    keymaps = [
        {
            key = "<leader><space>";
            action.__raw = ''
                function()
                    Snacks.picker.smart()
                end
            '';
            options = {
                desc = "Smart Find Files";
            };
        }
        {
            key = "<leader>,";
            action.__raw = ''
                function()
                    Snacks.picker.buffers()
                end
            '';
            options = {
                desc = "Buffers";
            };
        }
        {
            key = "<leader>/";
            action.__raw = ''
                function()
                    Snacks.picker.grep()
                end
            '';
            options = {
                desc = "Grep";
            };
        }
        {
            key = "<leader>:";
            action.__raw = ''
                function()
                    Snacks.picker.command_history()
                end
            '';
            options = {
                desc = "Command History";
            };
        }
        {
            key = "<leader>n";
            action.__raw = ''
                function()
                    Snacks.picker.notifications()
                end
            '';
            options = {
                desc = "Notification History";
            };
        }
        {
            key = "<leader>e";
            action.__raw = ''
                function()
                    Snacks.explorer()
                end
            '';
            options = {
                desc = "File Explorer";
            };
        }
        # find
        {
            key = "<leader>fb";
            action.__raw = ''
                function()
                    Snacks.picker.buffers()
                end
            '';
            options = {
                desc = "Buffers";
            };
        }
        {
            key = "<leader>fc";
            action.__raw = ''
                function()
                    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
                end
            '';
            options = {
                desc = "Find Config File";
            };
        }
        {
            key = "<leader>ff";
            action.__raw = ''
                function()
                    Snacks.picker.files()
                end
            '';
            options = {
                desc = "Find Files";
            };
        }
        {
            key = "<leader>fg";
            action.__raw = ''
                function()
                    Snacks.picker.git_files()
                end
            '';
            options = {
                desc = "Find Git Files";
            };
        }
        {
            key = "<leader>fp";
            action.__raw = ''
                function()
                    Snacks.picker.projects()
                end
            '';
            options = {
                desc = "Projects";
            };
        }
        {
            key = "<leader>fr";
            action.__raw = ''
                function()
                    Snacks.picker.recent()
                end
            '';
            options = {
                desc = "Recent";
            };
        }
        # git
        {
            key = "<leader>gb";
            action.__raw = ''
                function()
                    Snacks.picker.git_branches()
                end
            '';
            options = {
                desc = "Git Branches";
            };
        }
        {
            key = "<leader>gl";
            action.__raw = ''
                function()
                    Snacks.picker.git_log()
                end
            '';
            options = {
                desc = "Git Log";
            };
        }
        {
            key = "<leader>gL";
            action.__raw = ''
                function()
                    Snacks.picker.git_log_line()
                end
            '';
            options = {
                desc = "Git Log Line";
            };
        }
        {
            key = "<leader>gs";
            action.__raw = ''
                function()
                    Snacks.picker.git_status()
                end
            '';
            options = {
                desc = "Git Status";
            };
        }
        {
            key = "<leader>gS";
            action.__raw = ''
                function()
                    Snacks.picker.git_stash()
                end
            '';
            options = {
                desc = "Git Stash";
            };
        }
        {
            key = "<leader>gd";
            action.__raw = ''
                function()
                    Snacks.picker.git_diff()
                end
            '';
            options = {
                desc = "Git Diff (Hunks)";
            };
        }
        {
            key = "<leader>gf";
            action.__raw = ''
                function()
                    Snacks.picker.git_log_file()
                end
            '';
            options = {
                desc = "Git Log File";
            };
        }
        # Grep
        {
            key = "<leader>sb";
            action.__raw = ''
                function()
                    Snacks.picker.lines()
                end
            '';
            options = {
                desc = "Buffer Lines";
            };
        }
        {
            key = "<leader>sB";
            action.__raw = ''
                function()
                    Snacks.picker.grep_buffers()
                end
            '';
            options = {
                desc = "Grep Open Buffers";
            };
        }
        {
            key = "<leader>sg";
            action.__raw = ''
                function()
                    Snacks.picker.grep()
                end
            '';
            options = {
                desc = "Grep";
            };
        }
        {
            key = "<leader>sw";
            action.__raw = ''
                function()
                    Snacks.picker.grep_word()
                end
            '';
            options = {
                desc = "Visual selection or word";
            };
            mode = [
                "n"
                "x"
            ];
        }
        # search
        {
            key = "<leader>s/";
            action.__raw = ''
                function()
                    Snacks.picker.search_history()
                end
            '';
            options = {
                desc = "Search History";
            };
        }
        {
            key = "<leader>sa";
            action.__raw = ''
                function()
                    Snacks.picker.autocmds()
                end
            '';
            options = {
                desc = "Autocmds";
            };
        }
        {
            key = "<leader>sb";
            action.__raw = ''
                function()
                    Snacks.picker.lines()
                end
            '';
            options = {
                desc = "Buffer Lines";
            };
        }
        {
            key = "<leader>sc";
            action.__raw = ''
                function()
                    Snacks.picker.command_history()
                end
            '';
            options = {
                desc = "Command History";
            };
        }
        {
            key = "<leader>sC";
            action.__raw = ''
                function()
                    Snacks.picker.commands()
                end
            '';
            options = {
                desc = "Commands";
            };
        }
        {
            key = "<leader>sd";
            action.__raw = ''
                function()
                    Snacks.picker.diagnostics()
                end
            '';
            options = {
                desc = "Diagnostics";
            };
        }
        {
            key = "<leader>sD";
            action.__raw = ''
                function()
                    Snacks.picker.diagnostics_buffer()
                end
            '';
            options = {
                desc = "Buffer Diagnostics";
            };
        }
        {
            key = "<leader>sh";
            action.__raw = ''
                function()
                    Snacks.picker.help()
                end
            '';
            options = {
                desc = "Help Pages";
            };
        }
        {
            key = "<leader>sH";
            action.__raw = ''
                function()
                    Snacks.picker.highlights()
                end
            '';
            options = {
                desc = "Highlights";
            };
        }
        {
            key = "<leader>si";
            action.__raw = ''
                function()
                    Snacks.picker.icons()
                end
            '';
            options = {
                desc = "Icons";
            };
        }
        {
            key = "<leader>sj";
            action.__raw = ''
                function()
                    Snacks.picker.jumps()
                end
            '';
            options = {
                desc = "Jumps";
            };
        }
        {
            key = "<leader>sk";
            action.__raw = ''
                function()
                    Snacks.picker.keymaps()
                end
            '';
            options = {
                desc = "Keymaps";
            };
        }
        {
            key = "<leader>sl";
            action.__raw = ''
                function()
                    Snacks.picker.loclist()
                end
            '';
            options = {
                desc = "Location List";
            };
        }
        {
            key = "<leader>sm";
            action.__raw = ''
                function()
                    Snacks.picker.marks()
                end
            '';
            options = {
                desc = "Marks";
            };
        }
        {
            key = "<leader>sM";
            action.__raw = ''
                function()
                    Snacks.picker.man()
                end
            '';
            options = {
                desc = "Man Pages";
            };
        }
        {
            key = "<leader>sp";
            action.__raw = ''
                function()
                    Snacks.picker.lazy()
                end
            '';
            options = {
                desc = "Search for Plugin Spec";
            };
        }
        {
            key = "<leader>sq";
            action.__raw = ''
                function()
                    Snacks.picker.qflist()
                end
            '';
            options = {
                desc = "Quickfix List";
            };
        }
        {
            key = "<leader>sR";
            action.__raw = ''
                function()
                    Snacks.picker.resume()
                end
            '';
            options = {
                desc = "Resume";
            };
        }
        {
            key = "<leader>su";
            action.__raw = ''
                function()
                    Snacks.picker.undo()
                end
            '';
            options = {
                desc = "Undo History";
            };
        }
        {
            key = "<leader>uC";
            action.__raw = ''
                function()
                    Snacks.picker.colorschemes()
                end
            '';
            options = {
                desc = "Colorschemes";
            };
        }
        # LSP
        {
            key = "gd";
            action.__raw = ''
                function()
                    Snacks.picker.lsp_definitions()
                end
            '';
            options = {
                desc = "Goto Definition";
            };
        }
        {
            key = "gD";
            action.__raw = ''
                function()
                    Snacks.picker.lsp_declarations()
                end
            '';
            options = {
                desc = "Goto Declaration";
            };
        }
        {
            key = "gr";
            action.__raw = ''
                function()
                    Snacks.picker.lsp_references()
                end
            '';
            options = {
                nowait = true;
                desc = "References";
            };
        }
        {
            key = "gI";
            action.__raw = ''
                function()
                    Snacks.picker.lsp_implementations()
                end
            '';
            options = {
                desc = "Goto Implementation";
            };
        }
        {
            key = "gy";
            action.__raw = ''
                function()
                    Snacks.picker.lsp_type_definitions()
                end
            '';
            options = {
                desc = "Goto T[y]pe Definition";
            };
        }
        {
            key = "<leader>ss";
            action.__raw = ''
                function()
                    Snacks.picker.lsp_symbols()
                end
            '';
            options = {
                desc = "LSP Symbols";
            };
        }
        {
            key = "<leader>sS";
            action.__raw = ''
                function()
                    Snacks.picker.lsp_workspace_symbols()
                end
            '';
            options = {
                desc = "LSP Workspace Symbols";
            };
        }
    ];
}
