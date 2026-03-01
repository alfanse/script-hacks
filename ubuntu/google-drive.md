# rclone - for googlde drive access
install instructions: https://ucr-research-computing.github.io/Knowledge_Base/how_to_mount_google_drive.html
```
# download
curl https://rclone.org/install.sh | sudo bash

rclone config

# start mount locally
rclone mount gdrive: ~/gdrive

# added rclone mount command to crontab - to start at machine startup
(crontab -l 2>/dev/null; echo "@reboot rclone mount gdrive: $HOME/gdrive") | crontab -

crontab -l
```

google: https://console.cloud.google.com/auth/branding?project=my-bitsandbobs-1558


How to use crontab: https://help.ubuntu.com/community/CronHowto

Users crontab files are located in this directory `/var/spool/cron/crontabs`

Cron jobs run are all logged by default to `/var/log/syslog`


## problem running rclone in crontab (by claude)

 why isn't this crontab statement running in ubuntu on startup?
  @reboot rclone mount gdrive: /home/alfanse/gdrive                                         
                                                                                                                                                                                                                                          
● Several common reasons why @reboot rclone mount fails in crontab:
                                                                                                                                                                                                                                        
  1. Network Not Ready                                                                      @reboot runs very early — often before network interfaces are up. rclone can't reach Google Drive yet.                                                                                                                                  
                  
  2. PATH Is Minimal in Cron
  Cron uses a stripped-down PATH. If rclone isn't in /usr/bin or /bin, it won't be found.

  Fix: Use the full path:
  @reboot /usr/bin/rclone mount gdrive: /home/alfanse/gdrive

  Find it with which rclone.

  3. rclone mount Blocks (Foreground Process)

  rclone mount runs in the foreground by default — cron may not handle this well.

  Fix: Add --daemon flag:
```bash
@reboot /usr/bin/rclone mount gdrive: /home/alfanse/gdrive --daemon
```

  4. Mount Point Doesn't Exist Yet

  If /home/alfanse/gdrive doesn't exist, it will silently fail.

  mkdir -p /home/alfanse/gdrive

  5. No Logging (Silent Failures)

  You can't see what went wrong without output redirection:
  @reboot /usr/bin/rclone mount gdrive: /home/alfanse/gdrive --daemon --log-file=/home/alfanse/rclone.log

  Better Alternative: systemd Service

  For a reliable mount on boot, a systemd user service is more robust than cron — it handles network dependencies properly:

  # ~/.config/systemd/user/rclone-gdrive.service
  [Unit]
  Description=rclone gdrive mount
  After=network-online.target

  [Service]
  Type=notify
  ExecStart=/usr/bin/rclone mount gdrive: /home/alfanse/gdrive --vfs-cache-mode writes
  ExecStop=/bin/fusermount -u /home/alfanse/gdrive
  Restart=on-failure

  [Install]
  WantedBy=default.target

  Enable it with:
  systemctl --user enable rclone-gdrive
  systemctl --user start rclone-gdrive
  loginctl enable-linger $USER  # run even when not logged in

  The most likely culprit is network not ready or missing --daemon.
