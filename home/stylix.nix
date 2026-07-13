{
    inputs,
    ...
}:

{
    imports = [ inputs.stylix.homeManagerModules.stylix ];

    stylix = {
        targets = {
            nixvim.enable = false;
            tmux.enable = false;
            firefox.profileNames = [ "default" ];
        };
    };
}
