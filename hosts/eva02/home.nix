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
        ./home-extra.nix

        ../../home/common.nix

        ../../home/applications/hyprland/hyprland.nix

        ../../home/applications/dms/dms.nix

        ../../home/applications/kitty/kitty.nix

        ../../home/applications/opencode/opencode.nix

        ../../home/applications/qutebrowser/qutebrowser.nix
        ../../home/applications/firefox/firefox.nix

        ../../home/applications/git/git.nix

        ../../home/applications/go/go.nix
    ];

    # Host specific home packages
    home.packages = with pkgs; [
        localsend
        nautilus
        fractal
        proton-vpn
        heroic
        jellyfin-desktop

        fastfetch
        btop
        sqlit-tui

        xdg-utils

        yaru-theme
        adw-gtk3

        jdk

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
}
