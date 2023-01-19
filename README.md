# Ansipull

Anisible Pull implementation for my homelab; a one-click automation for home-server installation, configuration, and maintenance. Contains a Base-Role playbook which, after initial launch on target machine, creates its own user/Cronjob to semi-automate maintenance; cronjob tracks this github repo and pulls/reruns the config on any committed changes. Adapted from a fork of https://github.com/LearnLinuxTV/personal_ansible_desktop_configs.

# Repository's structure:

- **group_vars/**: Directory where variables will be applied on every system.

- **host_vars/**: Directory where each machine (by ip) gets a host_vars file that sets variables specific to that laptop/desktop/server.

- **playbooks/**: Additional playbooks to run or have triggered at will.

- **roles/**: Directory which contains the base, server, and workstation roles.

  - **roles/base**: Role which applies to every host/machine; contains things such as default configs, users, etc.

  - **roles/workstation**: Runs after the base role, and only on hosts designated to be workstations. GUI-specific things, such as GUI apps (Firefox, etc), Flatpaks, wallpaper, etc. Has a folder for the GNOME and MATE desktops.

  - **roles/server**: Runs after the base role, and only on hosts designated to be servers. Monitoring plugins, unattended-updates, server firewall rules, and other server-related things are configured here.

- **ansible.cfg**: Configuration settings for Ansible goes here.

- **hosts**: This is the inventory file; how Ansible knows what group to put a machine in.

- **local.yml**: This is the default (pull-mode) Playbook that Ansible uses to pull the other more contexual Playbooks above.

# Implementation

First download/install the Ansible app onto your targeted linux machine, then pull/run this config on the below command: 
```
ansible-pull -U https://github.com/EZecarias/ansipull.git
```
