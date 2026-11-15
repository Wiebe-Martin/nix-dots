{ pkgs, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

        polarity = "dark";

        icons.package = pkgs.papirus-icon-theme.override { color = "green"; };

        image = ../../../walls/glt_gruvbox.png;

        cursor = {
            name = "everforest-cursors";
            package = pkgs.everforest-cursors;
            size = 16;
        };
    };
}
