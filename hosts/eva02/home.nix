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

        ../../home/themes/theme/catppuccin.nix

        ../../home/applications/zsh/zsh.nix
        ../../home/applications/tmux/tmux.nix
        ../../home/applications/nixvim/nvim.nix
        ../../home/applications/git/git.nix
        ../../home/applications/git/gh.nix
        ../../home/applications/tmux-sessionizer/tmux-sessionizer.nix

        ../../home/applications/hyprland/hyprland.nix
        ../../home/applications/dms/dms.nix

        ../../home/applications/kitty/kitty.nix

        ../../home/applications/opencode/opencode.nix
        ../../home/applications/btop/btop.nix

        ../../home/applications/qutebrowser/qutebrowser.nix
        ../../home/applications/firefox/firefox.nix

        ../../home/applications/go/go.nix
    ];

    home.packages = with pkgs; [
        nerd-fonts.caskaydia-cove
        nerd-fonts.caskaydia-mono

        localsend
        nautilus
        proton-vpn
        fastfetch
        sqlit-tui
        xdg-utils
        yaru-theme
        adw-gtk3
        jdk
        ffmpeg

        inputs.kimi-code.packages.x86_64-linux.default

        heroic
        jellyfin-desktop
        mpv
        eden
        qbittorrent
        lunar-client
        prismlauncher
        unzip
    ];

    home.sessionVariables = {
        TERMINAL = "kitty";
    };

    home.pointerCursor.enable = true;

    programs.vesktop.enable = true;
}
