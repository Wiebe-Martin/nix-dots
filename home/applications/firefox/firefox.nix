{ pkgs, config, ... }:

{
  programs.firefox = {
    enable = true;

    languagePacks = [ "en-US" ];

    # Keep the legacy profile path: Firefox actually uses ~/.mozilla/firefox
    # here, and HM switches its default to the XDG path at stateVersion 26.05,
    # which would silently untheme the browser again.
    configPath = ".mozilla/firefox";

    # Adopt the existing active profile in ~/.mozilla/firefox so stylix
    # themes the profile Firefox actually uses.
    profiles.default = {
      id = 0;
      isDefault = true;
      path = "pvwqj0j4.default";
      # stylix.targets.firefox.colorTheme writes extensions.settings
      extensions.force = true;
    };

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
          };

          # Installed by stylix (stylix.targets.firefox.colorTheme);
          # must be allowed explicitly because of the "*" = blocked rule above.
          "FirefoxColor@mozilla.com" = {
            install_url = moz "firefox-color";
            installation_mode = "force_installed";
          };
        };
    };
  };
}
