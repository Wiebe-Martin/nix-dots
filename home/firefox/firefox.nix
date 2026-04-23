{ pkgs, ... }:

{
    programs.firefox = {
        enable = true;

        languagePacks = [ "en-US" ];

        policies = {
            # Updates & Background Services
            AppAutoUpdate = false;
            BackgroundAppUpdate = false;

            # Feature Disabling
            DisableFirefoxStudies = true;
            DisableFirefoxAccounts = true;
            DisableFirefoxScreenshots = true;
            DisableMasterPasswordCreation = true;
            DisableProfileImport = true;
            DisableProfileRefresh = true;
            DisableSetDesktopBackground = true;
            DisablePocket = true;
            DisableTelemetry = true;
            DisableFormHistory = true;

            # Access Restrictions
            BlockAboutConfig = false;
            BlockAboutProfiles = true;
            BlockAboutSupport = true;

            # UI and Behavior
            DisplayMenuBar = "never";
            DontCheckDefaultBrowser = true;
            HardwareAcceleration = false;
            OfferToSaveLogins = false;
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
                };
        };
    };
}
