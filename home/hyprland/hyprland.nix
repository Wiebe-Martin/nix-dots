{ config, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
    };

    xdg.configFile."hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/hyprland/config";
        recursive = true;
    };
}
