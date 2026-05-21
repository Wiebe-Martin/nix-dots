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
        inputs.dms-plugin-registry.modules.default
    ];

    home.sessionVariables = {
        DESKTOP_SHELL_COMMAND = "dms run";
        APP_LAUNCHER = "dms ipc call spotlight toggle";
        LOCK_SCREEN = "dms ipc call lock lock";
        POWER_MENU = "dms ipc call powermenu toggle";
    };

    programs.dank-material-shell = {
        enable = true;

        enableSystemMonitoring = true;

        plugins = {
            tailscale.enable = true;
        };

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

            useAutoLocation = true;

            showWorkspaceIndex = true;

            matugenTemplateGtk = true;
            matugenTemplateNiri = false;
            matugenTemplateHyprland = false;
            matugenTemplateMangowc = true;
            matugenTemplateQt5ct = true;
            matugenTemplateQt6ct = true;
            matugenTemplateFirefox = false;
            matugenTemplatePywalfox = false;
            matugenTemplateZenBrowser = false;
            matugenTemplateVesktop = false;
            matugenTemplateVencord = false;
            matugenTemplateEquibop = false;
            matugenTemplateGhostty = false;
            matugenTemplateKitty = false;
            matugenTemplateFoot = false;
            matugenTemplateAlacritty = false;
            matugenTemplateNeovim = false;
            matugenTemplateWezterm = false;
            matugenTemplateDgop = false;
            matugenTemplateKcolorscheme = false;
            matugenTemplateVscode = false;
            matugenTemplateEmacs = false;
            matugenTemplateZed = false;

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
                        "memUsage"
                    ]
                    ++ lib.optionals config.my.host.isLaptop [
                        "battery"
                    ]
                    ++ [
                        "notificationButton"
                        "tailscale"
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
