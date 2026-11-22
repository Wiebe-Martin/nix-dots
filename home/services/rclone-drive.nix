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
            ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/GoogleDrive";
            ExecStart = ''
                ${pkgs.rclone}/bin/rclone mount gdrive: %h/GoogleDrive \
                  --vfs-cache-mode full \
                  --vfs-cache-max-age 24h \
                  --vfs-cache-max-size 10G \
                  --dir-cache-time 12h \
                  --poll-interval 15s
            '';
            ExecStop = "/run/wrappers/bin/fusermount3 -u %h/GoogleDrive";
            Restart = "on-failure";
            RestartSec = "10s";
        };

        Install = {
            WantedBy = [ "default.target" ];
        };
    };
}
