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
    home.packages = with pkgs; [
        grim
        slurp
        swappy
        cliphist
    ];

    xdg.configFile."hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/applications/hyprland/config";
        recursive = true;
    };

    home.file."nix-dots/home/applications/hyprland/config/hyprland/monitor.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/applications/hyprland/overrides/${host}/monitor.lua";
    };

    home.file."nix-dots/home/applications/hyprland/config/hyprland/workspaces.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/applications/hyprland/overrides/${host}/workspaces.lua";
    };
}
