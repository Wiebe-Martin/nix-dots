{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../common.nix

        ../../modules/system/systemd-boot.nix
        ../../modules/system/locals.nix

        ../../modules/windowmanager/dwm.nix

        ../../modules/shell/zsh.nix

        ../../modules/net/networkmanager.nix

        ../../modules/audio/pipewire.nix
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "workbox";

    services.xserver.enable = true;

    services.gnome.gnome-keyring.enable = true;
}
