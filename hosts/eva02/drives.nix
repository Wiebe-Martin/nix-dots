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
}
