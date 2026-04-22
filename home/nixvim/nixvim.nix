{ pkgs, config, ... }:

{
    imports = [
        ./core/keymaps.nix
        ./core/options.nix

        ./plugins/treesitter.nix
        ./plugins/oil.nix
        ./plugins/indent-blankline.nix
        ./plugins/snacks.nix
        ./plugins/lualine.nix
        ./plugins/tmux.nix
        ./plugins/blink.nix
        ./plugins/tmux.nix
        ./plugins/harpoon.nix
        ./plugins/lsp.nix
        ./plugins/conform.nix
        ./plugins/misc.nix
        ./plugins/dap.nix

        ./colorshemes/gruvbox.nix
    ];

    enable = true;
}
