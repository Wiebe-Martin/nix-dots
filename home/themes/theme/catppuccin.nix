{ pkgs, inputs, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

        polarity = "dark";

        image = ../../../walls/wallhaven-mpzlq1_1920x1080.png;

        cursor = {
            name = "mochaDark";
            package = pkgs.catppuccin-cursors.mochaDark;
            size = 24;
        };
    };

    programs.nixvim.colorschemes.catppuccin = {
        enable = true;

        settings = {
            flavour = "macchiato";

            float = {
                transparent = true;
            };

            integrations = {
                cmp = true;
                gitsigns = true;
                blink_cmp = {
                    style = "bordered";
                };
                treesitter = true;
                harpoon = true;
                snacks = true;
            };

            transparent_background = true;
        };
    };
}
