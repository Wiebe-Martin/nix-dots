{ pkgs, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";

        polarity = "dark";

        image = ../../../walls/wallhaven-mpzlq1_1920x1080.png;

        cursor = {
            name = "everforest-cursors";
            package = pkgs.everforest-cursors;
            size = 16;
        };
    };
}
