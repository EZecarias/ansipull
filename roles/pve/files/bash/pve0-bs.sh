#!/bin/bash

#update apt and install syncthing
curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
apt-get update -y
apt-get install syncthing -y
wget 192.168.0.101:8080/0syncthing@.service -P /etc/systemd/system/syncthing@.service
systemctl daemon-reload
systemctl enable syncthing@root.service

#copy syncthing configs from www
wget 192.168.0.101:8080/0config.xml -P ~/.config/syncthing/config.xml
wget 192.168.0.101:8080/0config.xml.v0 -P ~/.config/syncthing/config.xml.v0

#copy sys configs from www
wget 192.168.0.101:8080/sys/logind.conf --directory-prefix=/etc/systemd/logind.conf
systemctl restart systemd-logind
wget 192.168.0.101:8080/sys/grub --directory-prefix=/etc/default/grub
update-grub

apt install ansible busybox cron git -y

wget 192.168.0.101:8080/pve-bb.sh -P /etc/init.d/pve-bb.sh
chmod +x /etc/init.d/pve-bb.sh
update-rc.d pve-bb.sh defaults

ansible-pull -U https://github.com/EZecarias/ansipull.git

reboot
