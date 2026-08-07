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

        ../../home/applications/dwmblocks/dwmblocks.nix

        ../../home/applications/st/st.nix
        ../../home/applications/zathura/zathura.nix

        ../../home/applications/opencode/opencode.nix
        ../../home/applications/btop/btop.nix

        ../../home/applications/qutebrowser/qutebrowser.nix
        ../../home/applications/firefox/firefox.nix
    ];

    home.packages = with pkgs; [
        freerdp

        lazygit
        lazydocker

        libxau
        brightnessctl

        unzip
    ];

    xdg.mimeApps = {
        enable = true;

        defaultApplications = {
            "application/pdf" = [ "org.pwmt.zathura.desktop" ];
        };
    };
}
