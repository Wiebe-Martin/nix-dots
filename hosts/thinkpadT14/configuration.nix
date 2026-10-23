{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../common.nix

        ../../modules/system/systemd-boot.nix
        ../../modules/system/locals.nix

        ../../modules/displaymanager/ly.nix

        ../../modules/windowmanager/mango.nix
        ../../modules/windowmanager/hyprland.nix

        ../../modules/shell/zsh.nix

        ../../modules/net/networkmanager.nix
        ../../modules/net/tailscale.nix

        ../../modules/audio/pipewire.nix

        ../../modules/misc/smb.nix
        ../../modules/misc/zram.nix

        ../../modules/programs/nautilus.nix

        ../../modules/virtualization/virtmanager.nix
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "thinkpadt14";

    programs.steam = {
        enable = true;
    };

    services = {
        xserver.enable = true;
        gnome.gnome-keyring.enable = true;
        tlp.enable = true;
        tlp.pd.enable = true;
        upower.enable = true;
    };
}
