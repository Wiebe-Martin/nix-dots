{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./drives.nix

        ../common.nix

        ../../modules/system/systemd-boot.nix
        ../../modules/system/locals.nix

        ../../modules/audio/pipewire.nix

        ../../modules/shell/zsh.nix

        ../../modules/net/networkmanager.nix

        ../../modules/windowmanager/hyprland.nix

        ../../modules/misc/smb.nix
    ];
    hardware = {
        bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
    };

    networking.hostName = "eva02";

    services.xserver.xkb = {
        layout = "eu";
        variant = "";
    };

    users.users.martin = {
        isNormalUser = true;
        description = "Martin Wiebe";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];
    };

    services.displayManager = {
        defaultSession = "hyprland";
        ly = {
            enable = true;
        };
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        wget
        git
        vim
    ];

    services.openssh.enable = true;

    programs.steam = {
        enable = true;
    };

    networking.firewall = {
        enable = true;
        allowedTCPPorts = [
            80
            443
            53317
        ];
    };

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    system.stateVersion = "25.11";
}
