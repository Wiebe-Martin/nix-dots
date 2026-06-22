let
    opts = {
        noremap = true;
        silent = true;
    };
in

{
    globals = {
        mapleader = " ";
        maplocalleader = " ";

        have_nerd_font = true;
    };

    keymaps = [
        # Disable the spacebar key's default behavior in Normal and Visual modes
        {
            mode = [
                "n"
                "v"
            ];
            key = "<Space>";
            action = "<Nop>";
            options = {
                silent = true;
            };
        }

        # save file
        {
            mode = "n";
            key = "<C-s>";
            action = "<cmd> w <CR>";
            options = opts;
        }

        # save file without auto-formatting
        {
            mode = "n";
            key = "<leader>sn";
            action = "<cmd>noautocmd w <CR>";
            options = opts;
        }

        # quit file
        {
            mode = "n";
            key = "<C-q>";
            action = "<cmd> q <CR>";
            options = opts;
        }

        # delete single character without copying into register
        {
            mode = "n";
            key = "x";
            action = "\"_x";
            options = opts;
        }

        # open file explorer
        {
            mode = "n";
            key = "<leader>mf";
            action = "<cmd> Lexplore <CR>";
            options = opts // {
                desc = "Open netrw file explorer";
            };
        }

        # Vertical scroll and center
        {
            mode = "n";
            key = "<C-d>";
            action = "<C-d>zz";
            options = opts;
        }
        {
            mode = "n";
            key = "<C-u>";
            action = "<C-u>zz";
            options = opts;
        }

        # Find and center
        {
            mode = "n";
            key = "n";
            action = "nzzzv";
            options = opts;
        }
        {
            mode = "n";
            key = "N";
            action = "Nzzzv";
            options = opts;
        }

        # Move lines around
        {
            mode = "v";
            key = "J";
            action = ":m '>+1<CR>gv=gv";
            options = opts;
        }
        {
            mode = "v";
            key = "K";
            action = ":m '<-2<CR>gv=gv";
            options = opts;
        }

        # Buffers
        {
            mode = "n";
            key = "<leader>x";
            action = ":bdelete!<CR>";
            options = opts;
        } # close buffer
        {
            mode = "n";
            key = "<leader>b";
            action = "<cmd> enew <CR>";
            options = opts;
        } # new buffer

        # Window management
        {
            mode = "n";
            key = "<leader>v";
            action = "<C-w>v";
            options = opts;
        } # split window vertically
        {
            mode = "n";
            key = "<leader>h";
            action = "<C-w>s";
            options = opts;
        } # split window horizontally
        {
            mode = "n";
            key = "<leader>se";
            action = "<C-w>=";
            options = opts;
        } # make split windows equal width & height
        {
            mode = "n";
            key = "<leader>xs";
            action = ":close<CR>";
            options = opts;
        } # close current split window

        # Navigate between splits

        {
            mode = "n";
            key = "<M-k>";
            action = ":wincmd k<CR>";
            options = opts;
        }

        {
            mode = "n";
            key = "<M-j>";
            action = ":wincmd j<CR>";
            options = opts;
        }

        {
            mode = "n";
            key = "<M-h>";
            action = ":wincmd h<CR>";
            options = opts;
        }

        {
            mode = "n";
            key = "<M-l>";
            action = ":wincmd l<CR>";
            options = opts;
        }

        # Decrease vertical split width
        {
            mode = "n";
            key = "<M-C-h>";
            action = ":vertical resize -5<CR>";
            options = opts;
        }

        # Increase vertical split width
        {
            mode = "n";
            key = "<M-C-l>";
            action = ":vertical resize +5<CR>";
            options = opts;
        }

        # Navigate between and out of terminals
        {
            mode = "t";
            key = "<esc>";
            action = "[[<C-\><C-n>]]";
            options = {
                buffer = false;
            };
        }
        {
            mode = "t";
            key = "<M-h>";
            action = "[[<Cmd>wincmd h<CR>]]";
            options = {
                buffer = false;
            };
        }
        {
            mode = "t";
            key = "<M-j>";
            action = "[[<Cmd>wincmd j<CR>]]";
            options = {
                buffer = false;
            };
        }
        {
            mode = "t";
            key = "<M-k>";
            action = "[[<Cmd>wincmd k<CR>]]";
            options = {
                buffer = false;
            };
        }
        {
            mode = "t";
            key = "<M-l>";
            action = "[[<Cmd>wincmd l<CR>]]";
            options = {
                buffer = false;
            };
        }

        # Toggle line wrapping
        {
            mode = "n";
            key = "<leader>lw";
            action = "<cmd>set wrap!<CR>";
            options = opts;
        }

        # Stay in indent mode
        {
            mode = "v";
            key = "<";
            action = "<gv";
            options = opts;
        }
        {
            mode = "v";
            key = ">";
            action = ">gv";
            options = opts;
        }

        # Keep last yanked when pasting
        {
            mode = "v";
            key = "p";
            action = "\"_dP";
            options = opts;
        }
        # Diagnostic keymaps
        {
            mode = "n";
            key = "<leader>d";
            action.__raw = ''
                vim.diagnostic.open_float
            '';
            options = opts // {
                desc = "Open floating diagnostic message";
            };
        }
        {
            mode = "n";
            key = "<leader>q";
            action.__raw = ''
                vim.diagnostic.setloclist
            '';
            options = opts // {
                desc = "Open diagnostic list";
            };
        }

        # Format json
        {
            mode = "n";
            key = "<leader>fj";
            action = "<cmd> :%!jq '.'<CR>";
            options = opts // {
                desc = "Format current json file";
            };
        }

        # tmux-sessionizer
        {
            mode = "n";
            key = "<C-f>";
            action = "<cmd>silent !tmux neww tmux-sessionizer<CR>";
            options = opts;
        }

        # Clear highlights on search when pressing <Esc> in normal mode
        {
            mode = "n";
            key = "<Esc>";
            action = "<cmd>nohlsearch<CR>";
            options = opts;
        }
    ];
}
