{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../common.nix

        ../../modules/system/systemd-boot.nix
        ../../modules/system/locals.nix

        ../../modules/windowmanager/mango.nix
        ../../modules/windowmanager/hyprland.nix

        ../../modules/shell/zsh.nix

        ../../modules/net/networkmanager.nix
        ../../modules/net/tailscale.nix

        ../../modules/audio/pipewire.nix

        ../../modules/misc/smb.nix
        ../../modules/misc/zram.nix

        ../../modules/virtualization/virtmanager.nix
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "thinkpadt14";

    services.xserver.enable = true;

    services.gnome.gnome-keyring.enable = true;

    services.displayManager.ly.settings = {
        animation = "dur_file";
        dur_file_path = "/home/martin/nix-dots/walls/blackhole-smooth-240x67.dur";
        colormix_col1 = "0x00FF0000";
        colormix_col2 = "0x000000FF";
        colormix_col3 = "0x20000000";
    };

    services.tlp.enable = true;
    services.tlp.pd.enable = true;

    services.upower.enable = true;
}
