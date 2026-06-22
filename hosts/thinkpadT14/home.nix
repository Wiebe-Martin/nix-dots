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

        ../../home/applications/mango/mango.nix
        ../../home/applications/hyprland/hyprland.nix

        ../../home/applications/dms/dms.nix
        # ../../home/noctalia-shell/noctalia.nix

        ../../home/applications/kitty/kitty.nix
        ../../home/applications/zathura/zathura.nix

        ../../home/applications/opencode/opencode.nix
        ../../home/applications/btop/btop.nix

        ../../home/applications/qutebrowser/qutebrowser.nix
        ../../home/applications/firefox/firefox.nix

        ../../home/applications/misc/misc.nix
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
        libxau
        brightnessctl

        yaru-theme
        adw-gtk3

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
