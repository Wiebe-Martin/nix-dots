{
    inputs,
    config,
    pkgs,
    lib,
    ...
}:

{
    home.username = "martin";
    home.stateVersion = "25.11";

    imports = [
        ../../home/common.nix

        ../../home/mango/mango.nix
        ../../home/hyprland/hyprland.nix

        ../../home/dms/dms.nix
        # ../../home/noctalia-shell/noctalia.nix

        ../../home/kitty/kitty.nix
        ../../home/zathura/zathura.nix

        ../../home/opencode/opencode.nix
        ../../home/btop/btop.nix

        ../../home/qutebrowser/qutebrowser.nix
        ../../home/firefox/firefox.nix

        ../../home/misc/misc.nix
    ];

    # Host specific home packages
    home.packages = with pkgs; [
        localsend
        nautilus
        fractal
        proton-vpn
        freerdp
        qbz
        rpi-imager

        fastfetch
        btop
        sqlit-tui
        lazygit
        lazydocker

        xdg-utils
        brightnessctl

        yaru-theme

        jdk
        unzip

        ffmpeg
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
        TERMINAL = "kitty";
        XDG_CONFIG_HOME = "/home/martin/.config";
    };

    home.pointerCursor = {
        name = "everforest-cursors";
        package = pkgs.everforest-cursors;
        size = 16;
        gtk.enable = true;
    };

    xdg.mimeApps = {
        enable = true;

        defaultApplications = {
            "application/pdf" = [ "org.pwmt.zathura.desktop" ];
        };
    };
}
