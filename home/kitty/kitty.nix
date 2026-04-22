{
    programs.kitty = {
        enable = true;

        font = {
            name = "CaskaydiaCove Nerd Font Mono";
            size = 14;
        };

        extraConfig = ''
            background_opacity 0.8

            enable_audio_bell no

            include dank-theme.conf
        '';
    };
}
