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

        ../../home/applications/mango/mango.nix
        ../../home/applications/noctalia-shell/noctalia.nix

        ../../home/applications/kitty/kitty.nix
        ../../home/applications/zathura/zathura.nix

        ../../home/applications/opencode/opencode.nix
        ../../home/applications/btop/btop.nix

        ../../home/applications/qutebrowser/qutebrowser.nix
        ../../home/applications/firefox/firefox.nix
    ];

    home.packages = with pkgs; [
        freerdp
        qbz
        rpi-imager

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
