{
    inputs,
    config,
    pkgs,
    lib,
    ...
}:

{
    imports = [
        ../../home/common.nix

        ../../home/themes/theme/gruvbox.nix

        ../../home/applications/zsh/zsh.nix
        ../../home/applications/tmux/tmux.nix
        ../../home/applications/nixvim/nvim.nix
        ../../home/applications/git/git.nix
        ../../home/applications/git/gh.nix
        ../../home/applications/tmux-sessionizer/tmux-sessionizer.nix

        ../../home/applications/hyprland/hyprland.nix
        ../../home/applications/dms/dms.nix

        ../../home/applications/kitty/kitty.nix
        ../../home/applications/zathura/zathura.nix

        ../../home/applications/opencode/opencode.nix
        ../../home/applications/herdr/herdr.nix

        ../../home/applications/qutebrowser/qutebrowser.nix
        ../../home/applications/firefox/firefox.nix

        ../../home/applications/go/go.nix
    ];

    home.packages = with pkgs; [
        nerd-fonts.caskaydia-cove
        nerd-fonts.caskaydia-mono

        localsend
        proton-vpn
        fastfetch
        btop
        sqlit-tui
        xdg-utils
        yaru-theme
        adw-gtk3
        jdk
        ffmpeg

        heroic
        jellyfin-desktop
        spotify
        mpv
        eden
        lunar-client
        prismlauncher
        vesktop
        teamviewer

        qbittorrent

        herdr
        codex

        pnpm_12
        nodejs_26
    ];

    home.sessionVariables = {
        TERMINAL = "kitty";
    };

    home.pointerCursor.enable = true;
}
