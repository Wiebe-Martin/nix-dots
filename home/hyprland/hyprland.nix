{ config, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;

        settings = {
            "monitor" = "eDP-1,1920x1080@60.02,0x0,1";

            "$terminal" = "kitty --single-instance";
            "$fileManager" = "nautilus";
            "$menu" = "dms ipc call spotlight toggle";
            "$browser" = "qutebrowser";

            source = [
                "${config.home.homeDirectory}/nix-dots/home/hyprland/config/animations.conf"
                "${config.home.homeDirectory}/nix-dots/home/hyprland/config/appearance.conf"
                "${config.home.homeDirectory}/nix-dots/home/hyprland/config/autostart.conf"
                "${config.home.homeDirectory}/nix-dots/home/hyprland/config/env.conf"
                "${config.home.homeDirectory}/nix-dots/home/hyprland/config/input.conf"
                "${config.home.homeDirectory}/nix-dots/home/hyprland/config/keybind.conf"
                "${config.home.homeDirectory}/nix-dots/home/hyprland/config/rules.conf"
                "${config.home.homeDirectory}/.config/hypr/dms/colors.conf"
            ];
        };
    };

    # xdg.configFile."hypr" = {
    #     source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/hypr/config";
    #     recursive = true;
    # };
}
