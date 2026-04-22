{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "Martin Wiebe";
                email = "m.wiebe311204@gmail.com";
            };
            init.defaultBranch = "main";
            push = {
                autoSetupRemote = true;
            };
        };
    };
}
