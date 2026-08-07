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

    services.displayManager.ly.settings = {
        animation = "dur_file";
        dur_file_path = "/home/martin/nix-dots/walls/blackhole-smooth-240x67.dur";
        colormix_col1 = "0x00FF0000";
        colormix_col2 = "0x000000FF";
        colormix_col3 = "0x20000000";
    };
}
