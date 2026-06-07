{ pkgs, config, ... }:

{
    programs.firefox = {
        enable = true;

        languagePacks = [ "en-US" ];

        configPath = "${config.xdg.configHome}/mozilla/firefox";

        policies = {
            # Updates & Background Services
            AppAutoUpdate = false;
            BackgroundAppUpdate = false;

            # Feature Disabling
            DisableFirefoxStudies = true;
            DisableFirefoxAccounts = true;
            DisableFirefoxScreenshots = true;
            DisableProfileImport = true;
            DisableProfileRefresh = true;
            DisableSetDesktopBackground = true;
            DisablePocket = true;
            DisableTelemetry = true;
            DisableFormHistory = true;

            # Access Restrictions
            BlockAboutConfig = false;
            BlockAboutProfiles = false;
            BlockAboutSupport = false;

            # UI and Behavior
            DisplayMenuBar = "never";
            DontCheckDefaultBrowser = true;
            DefaultDownloadDirectory = "~/Downloads";

            # Extensions
            ExtensionSettings =
                let
                    moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
                in
                {
                    "*".installation_mode = "blocked";

                    "uBlock0@raymondhill.net" = {
                        install_url = moz "ublock-origin";
                        installation_mode = "force_installed";
                        updates_disabled = true;
                    };

                    "{d3f8e52b-140d-41e8-ae4a-a9710ab6a886}" = {
                        install_url = moz "gruvbox-true-dark";
                        installation_mode = "force_installed";
                        updates_disabled = true;
                    };
                };
        };
    };
}
