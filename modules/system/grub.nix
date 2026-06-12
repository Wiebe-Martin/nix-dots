{
    boot.loader = {
        efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
        };
        grub = {
            efiSupport = true;
            #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
            device = "nodev";
        };
    };
}
