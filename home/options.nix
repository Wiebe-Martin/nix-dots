{ lib, config, ... }:

{
    options.my.host.isLaptop = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether this host is a laptop.";
    };
}
