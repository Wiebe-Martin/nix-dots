{ inputs, pkgs, ... }:

{
    home.sessionVariables = {
        DESKTOP_SHELL_COMMAND = "noctalia";
        APP_LAUNCHER = "noctalia msg panel-toggle launcher";
        LOCK_SCREEN = "noctalia msg screen-lock";
        POWER_MENU = "noctalia msg panel-toggle session";
    };

    imports = [
        inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
        enable = true;

        settings = {
            # theme = {
            #     mode = "dark";
            #     source = "builtin";
            #     builtin = "Catppuccin";
            # };

            wallpaper = {
                enabled = true;
                default.path = "/home/martin/nix-dots/walls/glt_gruvbox.png";
            };
        };
    };
}
