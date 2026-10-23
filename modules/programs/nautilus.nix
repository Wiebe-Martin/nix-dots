{ pkgs, ... }:
{
    programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "kitty";
    };

    environment.systemPackages = with pkgs; [
        nautilus
    ];
}
