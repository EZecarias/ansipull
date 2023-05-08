# Ansipull

An Anisible-pull implementation for my Linux laptop/desktop homelab servers; automated installation of apps and configuration of system preferences. An ansible user/Cronjob is created on all target machines to track this github repo and automatically pull/run config after any committed changes.

Adapted from a fork of https://github.com/LearnLinuxTV/personal_ansible_desktop_configs.

# Repository's structure:
- **roles/**: Directory of repo's system of nested or divergent host/device roles.
  - **pve/**: Role unique to proxmox servers
  - **base/**: Role shared with the below hosts
    - **server/**: Role for my other servers
    - **workstation/**: Role unique to my workstations

- **ansible.cfg**: Default configuration settings file (inventory file name, log path)
  
- **hosts**: Inventory file; where Ansible assigns each machine to a role/group.

- **local.yml**: Default playbook; from which Ansible will pull all other contexual playbooks (by device's role): 1) pre-tasks, 2) contextual playbooks, 3) post-tasks.

# Implementation

First download/install the Ansible app onto your targeted linux machine, then pull/run this config on the below command: 
```
ansible-pull -U https://github.com/EZecarias/ansipull.git
```
