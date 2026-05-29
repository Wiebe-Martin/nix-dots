{ pkgs, ... }:

{
    home.packages = with pkgs; [
        go
        gcc
    ];

    programs.go = {
        enable = true;

        packages = {

        };
    };
}
