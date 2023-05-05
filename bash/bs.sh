#!/bin/bash 

sudo timedatectl set-timezone Canada/Eastern

sudo NEEDRESTART_MODE=a apt update && apt dist-upgrade -y

sudo NEEDRESTART_MODE=a apt install qemu-guest-agent -y

sudo NEEDRESTART_MODE=a apt install git -y

sudo NEEDRESTART_MODE=a apt install ansible -y

sudo NEEDRESTART_MODE=a apt install cron -y

sudo ansible-pull -U https://github.com/EZecarias/ansipull.git

sudo reboot
