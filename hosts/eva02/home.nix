{
    inputs,
    config,
    pkgs,
    lib,
    ...
}:

{
    imports = [
        ../../home/common.nix

        ../../home/themes/theme/dracula.nix

        ../../home/applications/hyprland/hyprland.nix

        ../../home/applications/dms/dms.nix

        ../../home/applications/kitty/kitty.nix

        ../../home/applications/opencode/opencode.nix

        ../../home/applications/qutebrowser/qutebrowser.nix
        ../../home/applications/firefox/firefox.nix

        ../../home/applications/go/go.nix
    ];

    home.packages = with pkgs; [
        heroic
        jellyfin-desktop
        mpv
    ];

    programs.vesktop.enable = true;
}
