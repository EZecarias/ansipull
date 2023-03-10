#!/bin/bash

#update apt and install syncthing
curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/>
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | tee /etc/a>
apt-get update -y
apt-get install syncthing -y
wget 192.168.0.100:8080/1/syncthing/syncthing@.service -P /etc/systemd/system/syncthing@.service
systemctl daemon-reload
systemctl enable syncthing@root.service

#copy syncthing configs from www
wget 192.168.0.100:8080/1/syncthing/config.xml -P ~/.config/syncthing/config.xml
wget 192.168.0.100:8080/1/syncthing/config.xml.v0 -P ~/.config/syncthing/config.xml.v0

#copy sys configs from www
wget 192.168.0.100:8080/sys/logind.conf --directory-prefix=/etc/systemd/logind.conf
systemctl restart systemd-logind
wget 192.168.0.100:8080/sys/grub --directory-prefix=/etc/default/grub
update-grub

apt install adb ethtool ffmpeg gcc git iperf -y

reboot
