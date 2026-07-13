{
    config,
    pkgs,
    lib,
    inputs,
    ...
}:

{
    imports = [
        inputs.stylix.homeModules.stylix
    ];

    stylix = {
        enable = true;

        targets = {
            nixvim.enable = false;
            tmux.enable = false;
            firefox.profileNames = [ "default" ];
        };

        polarity = "dark";

        base16Scheme = lib.mkDefault {
            base00 = "202020";
            base01 = "2a2827";
            base02 = "504945";
            base03 = "5a524c";
            base04 = "bdae93";
            base05 = "ddc7a1";
            base06 = "ebdbb2";
            base07 = "fbf1c7";
            base08 = "ea6962";
            base09 = "e78a4e";
            base0A = "d8a657";
            base0B = "a9b665";
            base0C = "89b482";
            base0D = "7daea3";
            base0E = "d3869b";
            base0F = "bd6f3e";
        };

        image = ../../walls/glt_gruvbox.png;

        cursor = {
            name = "everforest-cursors";
            package = pkgs.everforest-cursors;
            size = 16;
        };

        fonts = {
            monospace = {
                package = pkgs.nerd-fonts.caskaydia-mono;
                name = "CaskaydiaCove Nerd Font Mono";
            };
            sansSerif = {
                package = pkgs.nerd-fonts.caskaydia-cove;
                name = "CaskaydiaCove Nerd Font";
            };
            serif = {
                package = pkgs.nerd-fonts.caskaydia-cove;
                name = "CaskaydiaCove Nerd Font";
            };
            emoji = {
                package = pkgs.noto-fonts-color-emoji;
                name = "Noto Color Emoji";
            };
            sizes = {
                terminal = 14;
                applications = 12;
                desktop = 10;
                popups = 10;
            };
        };

        opacity = {
            applications = 0.8;
            terminal = 0.8;
            desktop = 0.6;
            popups = 0.6;
        };
    };
}
