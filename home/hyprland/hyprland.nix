{
    config,
    osConfig,
    inputs,
    pkgs,
    ...
}:

let
    host = osConfig.networking.hostName;
in
{
    xdg.configFile."hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/hyprland/config";
        recursive = true;
    };

    home.file."nix-dots/home/hyprland/config/hyprland/monitor.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/hyprland/overrides/${host}/monitor.lua";
    };

    home.file."nix-dots/home/hyprland/config/hyprland/workspaces.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/hyprland/overrides/${host}/workspaces.lua";
    };
}
