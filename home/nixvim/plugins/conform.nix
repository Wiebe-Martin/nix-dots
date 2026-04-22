{ pkgs, ... }:

{
    extraPackages = with pkgs; [
        stylua
        black
        prettier
        shfmt
        clang-tools
        nixfmt
    ];

    plugins.conform-nvim = {
        enable = true;
        settings = {
            notify_on_error = false;
            format_on_save = ''
                function(bufnr)
                    local disable_filetypes = { c = true, cpp = true }
                    if disable_filetypes[vim.bo[bufnr].filetype] then
                        return nil
                    else
                        return {
                            timeout_ms = 500,
                            lsp_format = "fallback",
                        }
                    end
                end
            '';
            formatters_by_ft = {
                lua = [ "stylua" ];
                javascript = [ "prettier" ];
                typescript = [ "prettier" ];
                javascriptreact = [ "prettier" ];
                typescriptreact = [ "prettier" ];
                json = [ "prettier" ];
                yaml = [ "prettier" ];
                markdown = [ "prettier" ];
                python = [
                    "black"
                    "ruff_format"
                ];
                sh = [ "shfmt" ];
                go = [ "goimports" ];
                c = [ "clang_format" ];
                cpp = [ "clang_format" ];
                nix = [ "nixfmt" ];
            };
            formatters = {
                stylua = {
                    append_args = [
                        "--indent-type"
                        "Spaces"
                        "--indent-width"
                        "4"
                    ];
                };
                shfmt = {
                    append_args = [
                        "-i"
                        "4"
                    ];
                };
                ruff = {
                    append_args = [
                        "--extend-select"
                        "I"
                        "--ignore"
                        "F401"
                    ];
                };
                nixfmt = {
                    append_args = [
                        "--indent"
                        "4"
                    ];
                };
            };
        };
    };

    keymaps = [
        {
            mode = "";
            key = "<leader>fm";
            action.__raw = ''
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end
            '';
            options = {
                desc = "[F]or[m]at buffer";
            };
        }
    ];
}
