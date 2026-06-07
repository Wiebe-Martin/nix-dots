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

    boot.kernelPackages = pkgs.linuxPackages_zen;

    hardware = {
        graphics = {
            package = pkgs.mesa;

            enable = true;
            enable32Bit = true;
            package32 = pkgs.pkgsi686Linux.mesa;
        };

        bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
    };

    networking.hostName = "thinkpadt14";

    services.xserver.enable = true;
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
        home = "/home/martin";
    };

    security.polkit.enable = true;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
        git
    ];

    services.gnome.gnome-keyring.enable = true;

    services.displayManager = {
        defaultSession = "";
        ly = {
            enable = true;
            settings = {
                animation = "dur_file";
                dur_file_path = "/home/martin/nix-dots/walls/blackhole-smooth-240x67.dur";
            };
        };
    };

    # services.power-profiles-daemon.enable = true;
    services.tlp.enable = true;
    services.tlp.pd.enable = true;

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
