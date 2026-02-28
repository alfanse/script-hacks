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

