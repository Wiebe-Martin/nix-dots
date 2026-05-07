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

        ../../home/kitty/kitty.nix

        ../../home/opencode/opencode.nix

        ../../home/qutebrowser/qutebrowser.nix
        ../../home/firefox/firefox.nix
    ];

    # Host specific home packages
    home.packages = with pkgs; [
        localsend
        nautilus
        fractal
        proton-vpn

        fastfetch
        btop
        sqlit-tui

        xdg-utils

        jdk

        ffmpeg
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
        XDG_CONFIG_HOME = "/home/martin/.config";
    };

    home.pointerCursor = {
        name = "everforest-cursors";
        package = pkgs.everforest-cursors;
        size = 16;
        gtk.enable = true;
    };
}
