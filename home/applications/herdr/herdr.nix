{ config, pkgs, ... }:

{
    home.packages = with pkgs; [ herdr ];

    xdg.configFile."herdr/config.toml".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/applications/herdr/config.toml";
}
