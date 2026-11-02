{ config, ... }:

{
    programs.opencode = {
        enable = true;
        cli = {
            theme = "stylix";
            keybinds = {
                leader = "space";
            };
            plugin = [ "vimcode@git+https://github.com/oribarilan/vimcode.git#v0.19.1" ];
        };
    };
}
