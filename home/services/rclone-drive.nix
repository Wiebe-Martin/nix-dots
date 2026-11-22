{ pkgs, ... }:

{
    systemd.user.services.rclone-gdrive = {
        Unit = {
            Description = "Mount Google Drive (rclone)";
            After = [ "network-online.target" ];
        };

        Service = {
            Type = "notify";
            # NixOS requires /run/wrappers/bin on PATH so rclone uses the setuid fusermount3 wrapper.
            Environment = [ "PATH=/run/wrappers/bin:${pkgs.coreutils}/bin" ];
            ExecStartPre = [
                "-/run/wrappers/bin/fusermount3 -uz %h/GoogleDrive"
                "${pkgs.coreutils}/bin/mkdir -p %h/GoogleDrive"
            ];
            ExecStart = ''
                ${pkgs.rclone}/bin/rclone mount gdrive: %h/GoogleDrive \
                  --vfs-cache-mode full \
                  --vfs-cache-max-age 24h \
                  --vfs-cache-max-size 10G \
                  --vfs-fast-fingerprint \
                  --vfs-read-ahead 128M \
                  --buffer-size 32M \
                  --dir-cache-time 12h \
                  --poll-interval 15s \
                  --drive-pacer-min-sleep 10ms \
                  --drive-pacer-burst 200
            '';
            ExecStop = "/run/wrappers/bin/fusermount3 -uz %h/GoogleDrive";
            Restart = "on-failure";
            RestartSec = "10s";
        };

        Install = {
            WantedBy = [ "default.target" ];
        };
    };
}
