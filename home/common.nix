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

        ./kitty/kitty.nix

        ./qutebrowser/qutebrowser.nix
        ./dms/dms.nix
        ./mango/mango.nix
    ];

    home.packages = with pkgs; [
        localsend

        nerd-fonts.caskaydia-cove
        nerd-fonts.caskaydia-mono
    ];

    home.sessionVariables = {
        # EDITOR = "emacs";
    };

    programs.home-manager.enable = true;
}
