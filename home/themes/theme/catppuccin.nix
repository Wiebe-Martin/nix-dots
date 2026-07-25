{ pkgs, inputs, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

        polarity = "dark";

        image = ../../../walls/wallhaven-mpzlq1_1920x1080.png;

        cursor = {
            name = "catppuccin-cursors";
            package = pkgs.catppuccin-cursors;
            size = 16;
        };
    };

    programs.nixvim.colorschemes.catppuccin = {
        enable = true;

        settings = {
            flavour = "mocha";

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
