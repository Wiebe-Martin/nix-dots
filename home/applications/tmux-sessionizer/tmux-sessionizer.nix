{ config, ... }:

{
    xdg.configFile."tmux-sessionizer" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/home/applications/tmux-sessionizer/config";
        recursive = true;
    };
}
