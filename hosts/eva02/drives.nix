{
    config,
    lib,
    pkgs,
    modulesPath,
    ...
}:

{
    fileSystems."/home" = {
        device = "/dev/disk/by-label/home";
        fsType = "btrfs";
        options = [ "subvol=/@home" ];
    };

    # fileSystems."/games" = {
    #     device = "/dev/disk/by-label/games";
    #     fsType = "btrfs";
    #     # options = [ "" ];
    # };
}
