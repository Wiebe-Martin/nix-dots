{
    programs.kitty = {
        enable = true;

        font = {
            name = "CaskaydiaCove Nerd Font Mono";
            size = 14;
        };

        themeFile = "GruvboxMaterialDarkHard";

        extraConfig = ''
            background_opacity 0.8

            enable_audio_bell no

            window_margin_width 5
        '';
    };
}
