{
    inputs,
    config,
    pkgs,
    lib,
    ...
}:

{
    home.username = "martin";
    home.stateVersion = "25.11";

    imports = [
        ../../home/common.nix
    ];

    # Host specific home packages
    home.packages = with pkgs; [

    ];
}
