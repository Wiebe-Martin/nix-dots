{ config, pkgs, ... }:

{
    nix.settings = {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
        experimental-features = [
            "nix-command"
            "flakes"
        ];
    };

    programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        flake = "${config.users.users.martin.home}/nix-dots";
    };

    environment.pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
    ];

    environment.systemPackages = with pkgs; [
        git
        vim
        wget
    ];

    hardware = {
        bluetooth = {
            enable = true;
            powerOnBoot = true;
        };

        graphics = {
            enable = true;
            enable32Bit = true;
        };
    };

    networking.firewall = {
        enable = true;
        allowedTCPPorts = [
            80
            443
            53317
        ];
    };

    nixpkgs.config.allowUnfree = true;

    security.polkit.enable = true;

    services.displayManager = {
        defaultSession = "hyprland";
        ly = {
            enable = true;
        };
    };

    services.xserver.xkb = {
        layout = "eu";
        variant = "";
    };

    system.stateVersion = "25.11";

    users.users.martin = {
        isNormalUser = true;
        description = "Martin Wiebe";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];
    };
}
