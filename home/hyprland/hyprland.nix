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

    home.file.".config/hypr/monior.lua".source = ./overrides/${host}/monitor.lua;
}
