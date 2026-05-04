{
    inputs,
    config,
    pkgs,
    ...
}:

{
    imports = [
        inputs.nixvim.homeModules.nixvim
    ];

    programs.nixvim = import ./nixvim.nix { inherit pkgs config; };

    home.packages = with pkgs; [
        ripgrep

        stylua
        black
        prettier
        shfmt
        clang-tools
        nixfmt
    ];
}
