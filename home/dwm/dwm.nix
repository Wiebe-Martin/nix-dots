{ config, pkgs, ... }:

{
    services.xserver.windowManager.dwm.package = pkgs.dwm.override {
        enable = true;
        src = ./config;
    };
}
