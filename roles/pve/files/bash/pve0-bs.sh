#!/bin/bash

#update apt and install syncthing
curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
apt-get update -y
apt-get install syncthing -y
wget 192.168.0.101:8080/0syncthing@.service -P /etc/systemd/system/
mv /etc/systemd/system/0syncthing@.service /etc/systemd/system/syncthing@.service 
systemctl daemon-reload
systemctl enable syncthing@root.service

#copy syncthing configs from www
wget 192.168.0.101:8080/0config.xml -P ~/.config/syncthing/
mv ~/.config/syncthing/0config.xml ~/.config/syncthing/config.xml
wget 192.168.0.101:8080/0config.xml.v0 -P ~/.config/syncthing/
mv ~/.config/syncthing/0config.xml.v0 ~/.config/syncthing/config.xml.v0

#copy sys configs from www
rm /etc/systemd/logind.conf
wget 192.168.0.101:8080/sys/logind.conf -P /etc/systemd/
systemctl restart systemd-logind
rm /etc/default/grub
wget 192.168.0.101:8080/sys/grub -P /etc/default/
update-grub

apt install ansible busybox cron git -y

rm /etc/systemd/system/busybox.service
wget 192.168.0.101:8080/busybox.service -P /etc/systemd/system/
systemctl daemon-reload
systemctl enable busybox.service
systemctl start busybox.service

ansible-pull -U https://github.com/EZecarias/ansipull.git

reboot
