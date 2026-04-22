{
    inputs,
    config,
    pkgs,
    ...
}:

{
    imports = [
        inputs.mangowm.hmModules.mango
    ];

    wayland.windowManager.mango.enable = true;

    xdg.configFile."mango" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/mango/config";
        recursive = true;
    };
}
