{
    inputs,
    pkgs,
    lib,
    config,
    ...
}:

{
    imports = [
        inputs.dms.homeModules.dank-material-shell
    ];

    programs.dank-material-shell = {
        enable = true;

        settings = {
            fontFamily = "CaskaydiaCove Nerd Font";
            monoFontFamily = "CaskaydiaCove Nerd Font Mono";
            fontWeight = 700;
            fontScale = 1;

            launcherLogoMode = "os";
            launcherLogoColorOverride = "primary";

            currentThemeName = "custom";
            currentThemeCategory = "registry";
            customThemeFile = "/home/martin/.config/DankMaterialShell/themes/gruvboxMaterial/theme.json";
            registryThemeVariants = {
                gruvboxMaterial = "hard";
            };

            showWorkspaceIndex = true;

            cornerRadius = 0;

            barConfigs = [
                {
                    id = "default";
                    name = "Main Bar";
                    position = 0;
                    leftWidgets = [
                        "launcherButton"
                        "workspaceSwitcher"
                        "layout"
                        "focusedWindow"
                    ];
                    centerWidgets = [
                        {
                            id = "music";
                            enabled = true;
                            mediaSize = 1;
                        }
                        "clock"
                        "weather"
                    ];
                    rightWidgets = [
                        "systemTray"
                        "notificationButton"
                    ]
                    ++ lib.optionals config.my.host.isLaptop [
                        "battery"
                    ]
                    ++ [
                        {
                            id = "controlCenterButton";
                            enabled = true;
                            showAudioPercent = true;
                            showMicIcon = true;
                        }
                    ];

                    enabled = true;
                    visible = true;
                    spacing = 4;
                    transparency = 0.6;

                    squareCorners = true;

                    borderEnabled = true;
                    borderColor = "primary";
                    borderOpacity = 0.1;

                    widgetOutlineEnabled = true;
                    widgetOutlineColor = "primary";
                    widgetOutlineOpacity = 0.15;
                    widgetOutlineThickness = 1;
                    widgetTransparency = 1;

                    popupTransparency = 1;

                    fontScale = 1;
                    iconScale = 1;
                }
            ];
        };
    };
}
