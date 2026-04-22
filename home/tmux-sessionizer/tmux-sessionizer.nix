{ config, ... }:

{
    xdg.configFile."tmux-sessionizer" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/tmux-sessionizer/config";
        recursive = true;
    };
}
