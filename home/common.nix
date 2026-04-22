{
    inputs,
    config,
    pkgs,
    ...
}:

{
    imports = [
        ./zsh/zsh.nix
        ./tmux/tmux.nix
        ./nixvim/nvim.nix
        ./git/git.nix
        ./git/gh.nix
        ./tmux-sessionizer/tmux-sessionizer.nix
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
