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
        ../../home/dms/dms.nix

        ../../home/kitty/kitty.nix

        ../../home/qutebrowser/qutebrowser.nix
        ../../home/firefox/firefox.nix
    ];

    # Host specific home packages
    home.packages = with pkgs; [
        localsend
        nautilus
        fractal

        fastfetch

        xdg-utils
    ];

    home.pointerCursor = {
        name = "everforest-cursors";
        package = pkgs.everforest-cursors;
        size = 16;
        gtk.enable = true;
    };
}
