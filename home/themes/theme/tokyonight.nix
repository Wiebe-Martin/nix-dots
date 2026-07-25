{ pkgs, inputs, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

        polarity = "dark";

        image = ../../../walls/wallhaven-mpzlq1_1920x1080.png;

        cursor = {
            name = "everforest-cursors";
            package = pkgs.everforest-cursors;
            size = 16;
        };
    };

    programs.nixvim.colorschemes.tokyonight = {
        enable = true;

        settings = {
            style = "night";

            transparent = true;
        };
    };
}
