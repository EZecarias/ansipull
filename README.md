# Ansipull

An Anisible-pull implementation for my Linux laptop/desktop and homelab servers; automated installation of apps and configuration of system preferences. Base-role playbook creates a user/Cronjob on target machine to track this github repo and automatically repull/rerun config on any committed changes.

Adapted from a fork of https://github.com/LearnLinuxTV/personal_ansible_desktop_configs.

# Repository's structure:

- **group_vars/**: Variables to be applied on every system.

- **host_vars/**: Files which set variables specific to host/machine (filename by ip).

- **playbooks/**: Additional playbooks to run or have triggered on direction.

- **roles/**: Directory of repo's system of nested or divergent host/device roles.

  - **base/**: Role applied to every host/machine; contains shared files, default configs, users, etc.

    - **files/**: 

    - **handlers/**: Feature which oulines the services configured by Base-role.

    - **tasks/**: Feature which oulines all Base-role's jobs.

      - **main.yml**: Playbook for the base role.

    - **templates/**: 

    - **vars/**: 

  - **pve/**: Role unique to proxmox hosts.
  
  - **workstation/**: Role unique to workstation hosts: GUI-specific things/apps (Firefox, etc), Flatpaks, wallpaper, etc. Has a folder for the GNOME and MATE desktops.

  - **server/**: Role unique to server hosts. Monitoring plugins, unattended-updates, server firewall rules, and other server-related things are configured here.

- **ansible.cfg**: Configuration settings for Ansible (inventory filename, log path, private key path, run/ssh playbook as this remote_user)

- **hosts**: Inventory file; where Ansible assigns each machine (by ip) to a role/group.

- **local.yml**: Default playbook; from which Ansible will pull all other contexual playbooks (by device's role): 1) pre-tasks, 2) contextual playbooks, 3) post-tasks.

# Implementation

First download/install the Ansible app onto your targeted linux machine, then pull/run this config on the below command: 
```
ansible-pull -U https://github.com/EZecarias/ansipull.git
```
