{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        qutebrowser
    ];

    xdg.configFile."qutebrowser" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/applications/qutebrowser/config";
        recursive = true;
    };
}
