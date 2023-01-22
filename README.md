# Ansipull

An Anisible-pull implementation for my Linux laptop/desktop and homelab servers; automated installation of apps and configuration of system preferences. Base-role playbook creates a user/Cronjob on target machine to track this github repo and automatically repull/rerun config on any committed changes.

Adapted from a fork of https://github.com/LearnLinuxTV/personal_ansible_desktop_configs.

# Repository's structure:

- **group_vars/**: Directory where variables will be applied on every system.

- **host_vars/**: A host_vars file sets variables specific to any one machine (by ip).

- **playbooks/**: Additional playbooks to run or have triggered at will.

- **roles/**: Contains the base, server, and workstation roles.

  - **base/**: Role applied to every host/machine; contains default configs, users, etc.

  - **pve/**: Runs after the base role, and only on proxmox hosts.
  
  - **workstation/**: Runs after the base role, and only on workstation hosts: GUI-specific things/apps (Firefox, etc), Flatpaks, wallpaper, etc. Has a folder for the GNOME and MATE desktops.

  - **server/**: Runs after the base role, and only on server hosts. Monitoring plugins, unattended-updates, server firewall rules, and other server-related things are configured here.

- **ansible.cfg**: Configuration settings for Ansible goes here. (inventory name, log path, location of private key,  run/ssh playbook as this remote_user)

- **hosts**: The inventory file; where Ansible assigns each machine (by ip) to a group.

- **local.yml**: This is the default (pull-mode) Playbook that Ansible uses to pull the other more contexual Playbooks above.

# Implementation

First download/install the Ansible app onto your targeted linux machine, then pull/run this config on the below command: 
```
ansible-pull -U https://github.com/EZecarias/ansipull.git
```
