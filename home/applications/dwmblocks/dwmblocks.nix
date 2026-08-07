{ pkgs, config, ... }:

{
    home.packages = [
        (pkgs.dwmblocks.overrideAttrs (oldAttrs: {
            src = ./dwmblocks;
        }))
    ];
}
