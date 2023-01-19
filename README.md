# Ansipull

An Anisible-pull implementation for my Linux laptop/desktop and homelab servers; automated installation of applications and configuration of system preferences. Base-role playbook creates a user/Cronjob on target machine to track this github repo and automatically repull/rerun config on any committed changes.

Adapted from a fork of https://github.com/LearnLinuxTV/personal_ansible_desktop_configs.

# Repository's structure:

- **group_vars/**: Directory where variables will be applied on every system.

- **host_vars/**: A host_vars file sets variables specific to any one machine (by ip).

- **playbooks/**: Additional playbooks to run or have triggered at will.

- **roles/**: Directory which contains the base, server, and workstation roles.

  - **roles/base**: Role which applies to every host/machine; contains things such as default configs, users, etc.

  - **roles/workstation**: Runs after the base role, and only on hosts designated to be workstations. GUI-specific things, such as GUI apps (Firefox, etc), Flatpaks, wallpaper, etc. Has a folder for the GNOME and MATE desktops.

  - **roles/server**: Runs after the base role, and only on hosts designated to be servers. Monitoring plugins, unattended-updates, server firewall rules, and other server-related things are configured here.

- **ansible.cfg**: Configuration settings for Ansible goes here.

- **hosts**: The inventory file; where Ansible assigns each machine (by ip) to a group.

- **local.yml**: This is the default (pull-mode) Playbook that Ansible uses to pull the other more contexual Playbooks above.

# Implementation

First download/install the Ansible app onto your targeted linux machine, then pull/run this config on the below command: 
```
ansible-pull -U https://github.com/EZecarias/ansipull.git
```
