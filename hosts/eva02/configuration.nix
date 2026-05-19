# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports = [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix

        ../../modules/system/systemd-boot.nix
        ../../modules/system/locals.nix

        ../../modules/audio/pipewire.nix

        ../../modules/shell/zsh.nix

        ../../modules/net/networkmanager.nix

        ../../modules/windowmanager/hyprland.nix

        ../../modules/misc/smb.nix
    ];

    networking.hostName = "eva02";

    environment.pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
    ];

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
        packages = with pkgs; [ ];
    };

    services.displayManager = {
        defaultSession = "";
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

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    system.stateVersion = "25.11"; # Did you read the comment?

}
