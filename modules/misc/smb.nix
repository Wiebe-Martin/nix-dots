{ pkgs, ... }:

{
    environment.systemPackages = [ pkgs.cifs-utils ];
    # NOTE: /etc/nixos/smb-secrets must be mode 600 and owned by root.
    # Consider moving it to a secrets manager like sops-nix or agenix.
    fileSystems."/home/martin/Tank" = {
        device = "//192.168.178.8/Data";
        fsType = "cifs";
        options =
            let
                automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

            in
            [ "${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100" ];
    };
}
