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

        ../../home/qutebrowser/qutebrowser.nix
        ../../home/dms/dms.nix
        ../../home/mango/mango.nix
        ../../home/kitty/kitty.nix
    ];

    # Host specific home packages
    home.packages = with pkgs; [
        localsend
    ];
}
