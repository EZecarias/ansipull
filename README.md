# Ansipull

An Anisible-pull implementation for my Linux laptop/desktop and homelab servers; automated installation of apps and configuration of system preferences. Base-role playbook creates a user/Cronjob on target machine to track this github repo and automatically repull/rerun config on any committed changes.

Adapted from a fork of https://github.com/LearnLinuxTV/personal_ansible_desktop_configs.

# Repository's structure:
- **roles/**: Directory of repo's system of nested or divergent host/device roles.

  - **base/**: Role to all hosts
  - **pve/**: Role unique to proxmox hosts
  - **server/**: Role unique to server hosts
  - **workstation/**: Role unique to workstation hosts

- **ansible.cfg**: Default configuration settings file (inventory file name, log path)
  
- **hosts**: Inventory file; where Ansible assigns each machine to a role/group.

- **local.yml**: Default playbook; from which Ansible will pull all other contexual playbooks (by device's role): 1) pre-tasks, 2) contextual playbooks, 3) post-tasks.

# Implementation

First download/install the Ansible app onto your targeted linux machine, then pull/run this config on the below command: 
```
ansible-pull -U https://github.com/EZecarias/ansipull.git
```
