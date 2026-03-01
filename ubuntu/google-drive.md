# rclone - for googlde drive access
install instructions: https://ucr-research-computing.github.io/Knowledge_Base/how_to_mount_google_drive.html
```
# download
curl https://rclone.org/install.sh | sudo bash

rclone config

# start mount locally
rclone mount gdrive: ~/gdrive

```

google: https://console.cloud.google.com/auth/branding?project=my-bitsandbobs-1558

## systemd Service

For a reliable mount on boot, a systemd user service is more robust than cron — it handles network dependencies properly:

`~/.config/systemd/user/rclone-gdrive.service`

source: [rclone-gdrive.service](rclone-gdrive.service)

Enable it with:
```
  # copy to systemd user location
  cp rclone-gdrive.service ~/.config/systemd/user/rclone-gdrive.service

  # start and re-start after change
  systemctl --user enable --now rclone-gdrive
  
  # run even when not logged in
  loginctl enable-linger $USER
```
