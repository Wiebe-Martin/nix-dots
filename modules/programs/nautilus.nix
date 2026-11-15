{ pkgs, ... }:
{
    programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "kitty";
    };

    environment.systemPackages = with pkgs; [
        nautilus
        # GTK falls back to Adwaita for missing GNOME symbolic icons.
        adwaita-icon-theme
    ];
}
