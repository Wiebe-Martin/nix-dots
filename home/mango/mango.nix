{
    inputs,
    config,
    pkgs,
    ...
}:

{
    xdg.configFile."mango" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/mango/config";
        recursive = true;
    };
}
