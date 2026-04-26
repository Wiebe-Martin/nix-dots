{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../../modules/windowmanager/mango.nix

        ../../modules/shell/zsh.nix

        ../../modules/audio/pipewire.nix

        ../../modules/misc/smb.nix
        ../../modules/misc/zram.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
        };

        bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
    };

    networking.hostName = "thinkpadt14"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Berlin";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };

    services.xserver.enable = true;
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    users.users.martin = {
        isNormalUser = true;
        description = "Martin Wiebe";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];
        home = "/home/martin";
    };

    environment.pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
    ];

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
        git
    ];

    services.displayManager = {
        defaultSession = "";
        ly = {
            enable = true;
        };
    };

    services.power-profiles-daemon.enable = true;

    services.upower.enable = true;

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
