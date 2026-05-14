{
    config,
    inputs,
    pkgs,
    ...
}:

{
    xdg.configFile."hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/hypr/config";
        recursive = true;
    };
}
