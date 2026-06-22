{ pkgs, ... }:

{
    home.packages = with pkgs; [
        gcc
        air
        templ
    ];

    programs.go = {
        enable = true;

        packages = {

        };
    };
}
