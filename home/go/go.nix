{ pkgs, ... }:

{
    home.packages = with pkgs; [
        gcc
        air
    ];

    programs.go = {
        enable = true;

        packages = {

        };
    };
}
