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

        ./applications/hyprland/hyprland.nix
        ./applications/kitty/kitty.nix
        ./applications/opencode/opencode.nix
        ./applications/qutebrowser/qutebrowser.nix
        ./applications/firefox/firefox.nix
    ];

    home.username = "martin";
    home.stateVersion = "25.11";

    home.packages = with pkgs; [
        nerd-fonts.caskaydia-cove
        nerd-fonts.caskaydia-mono

        localsend
        nautilus
        fractal
        proton-vpn
        fastfetch
        btop
        sqlit-tui
        xdg-utils
        yaru-theme
        adw-gtk3
        jdk
        ffmpeg
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
        TERMINAL = "kitty";
        XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    };

    home.pointerCursor = {
        name = "everforest-cursors";
        package = pkgs.everforest-cursors;
        size = 16;
        gtk.enable = true;
    };

    programs.home-manager.enable = true;
}
