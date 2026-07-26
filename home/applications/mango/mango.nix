{
    config,
    ...
}:

{
    xdg.configFile."mango" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/applications/mango/config";
        recursive = true;
    };
}
