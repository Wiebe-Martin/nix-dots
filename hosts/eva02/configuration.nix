{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./drives.nix

        ../common.nix

        # ../../modules/system/grub.nix
        ../../modules/system/lanzaboote.nix
        ../../modules/system/locals.nix

        ../../modules/audio/pipewire.nix

        ../../modules/shell/zsh.nix

        ../../modules/net/networkmanager.nix

        ../../modules/windowmanager/hyprland.nix

        ../../modules/misc/smb.nix
    ];

    networking.hostName = "eva02";

    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
        };
    };

    programs.steam = {
        enable = true;
    };
    programs.gamemode.enable = true;
    programs = {
        gamescope = {
            enable = true;
            # capSysNice = true;
        };
        steam.gamescopeSession.enable = true;
    };
}
