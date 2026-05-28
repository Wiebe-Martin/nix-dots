{ pkgs, ... }:

{
    home.packages = with pkgs; [
        go
        gcc
        air
        templ
    ];
}
