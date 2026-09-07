{
    inputs,
    config,
    pkgs,
    ...
}:

{
    imports = [
        ./themes/stylix.nix
    ];

    home.username = "martin";
    home.stateVersion = "25.11";

    home.sessionVariables = {
        EDITOR = "nvim";
        XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    };

    programs.home-manager.enable = true;
}
