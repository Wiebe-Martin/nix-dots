{
    inputs,
    config,
    pkgs,
    ...
}:

{
    imports = [
        ./applications/zsh/zsh.nix
        ./applications/tmux/tmux.nix
        ./applications/nixvim/nvim.nix
        ./applications/git/git.nix
        ./applications/git/gh.nix
        ./applications/tmux-sessionizer/tmux-sessionizer.nix
    ];

    home.packages = with pkgs; [
        nerd-fonts.caskaydia-cove
        nerd-fonts.caskaydia-mono
    ];

    home.sessionVariables = {
        # EDITOR = "emacs";
    };

    programs.home-manager.enable = true;
}
