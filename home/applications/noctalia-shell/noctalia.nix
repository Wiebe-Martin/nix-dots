{ inputs, pkgs, ... }:

{
    home.sessionVariables = {
        DESKTOP_SHELL_COMMAND = "noctalia";
        APP_LAUNCHER = "noctalia msg panel-toggle launcher";
        LOCK_SCREEN = "noctalia msg session lock";
        POWER_MENU = "noctalia msg panel-toggle session";
    };

    imports = [
        inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
        enable = true;
    };
}
