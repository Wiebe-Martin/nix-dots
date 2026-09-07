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

        ../../home/applications/opencode/opencode.nix
        ../../home/applications/btop/btop.nix
    ];

    home.packages = with pkgs; [
        fastfetch
        sqlit-tui
        jdk
        ffmpeg

        inputs.kimi-code.packages.x86_64-linux.default

        lazygit
        lazydocker

        unzip
    ];
}
