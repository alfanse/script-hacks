# Commands to drive Ubuntu

`subl .` - laucnh Sublime from this folder
`crontab -l` - list cron expressions for this user

# installers
## snap
sanboxed, continuous updates

```
sudo snap install keepassxc

# torrent clients
# sudo snap install utorrent -- wine dependant
sudo snap install transmission
sudo snap install intellij-idea --classic
```


## apt
system level, shared dependencies 

```
sudo apt install zip unzip
sudo apt install nodejs npm -y
sudo apt install curl
sudo apt install ripgrep

# github cli
sudo apt install gh

# go
sudo apt install golang-go
```


## Change shortcuts to mac
```
git clone https://github.com/rbreaves/kinto.git
cd kinto
./setup.py
```

# systemd Service
For a reliable mount on boot, a systemd user service is more robust than cron — it handles network dependencies properly:

Users path to systemd config: `~/.config/systemd/user/`

## systemctl commands

```bash
# Show all services and their state:
systemctl --type=service --state=active list-units

# Show currently running services:
systemctl --type=service --state=running list-units
```

# Crontab 
How to use crontab: https://help.ubuntu.com/community/CronHowto

Users crontab files are located in this directory `/var/spool/cron/crontabs`

Cron jobs run are all logged by default to `/var/log/syslog`

## contab commands

```bash
# List
crontab -l

# edit
crontab -e
```
