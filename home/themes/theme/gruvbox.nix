{ pkgs, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

        polarity = "dark";

        image = ../../../walls/aphex_twin_gruvbox.jpg;

        cursor = {
            name = "everforest-cursors";
            package = pkgs.everforest-cursors;
            size = 16;
        };
    };
}
