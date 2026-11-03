{
    config,
    pkgs,
    inputs,
    ...
}:

{
    imports = [
        inputs.nixos-wsl.nixosModules.default

        ../../modules/shell/zsh.nix
        ../../modules/system/locals.nix
    ];

    wsl.enable = true;
    wsl.defaultUser = "martin";

    nix.settings = {
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

    environment.systemPackages = with pkgs; [
        git
        vim
        wget
    ];

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "25.11";

    users.users.martin = {
        isNormalUser = true;
        description = "Martin Wiebe";
        extraGroups = [
            "wheel"
        ];
    };
}
