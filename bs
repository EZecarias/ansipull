#!/bin/bash 

timedatectl set-timezone Canada/Eastern

apt update && apt dist-upgrade -y

apt install qemu-guest-agent -y

apt install git -y

apt install ansible -y

apt install cron -y

ansible-pull -U https://github.com/EZecarias/ansipull.git

reboot
