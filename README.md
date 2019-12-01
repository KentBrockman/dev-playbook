# Development Box Ansible Playbook

An ansible playbook to set up my development machine exactly how I like it!
Currently targeting Pop!\_OS 19.10.

## Installation

1. Install Ansible. I'm currently using 2.8.
   ```
   sudo apt install ansible
   ```
2. Install modules:
   ```
   ansible-galaxy install basvandenbrink.firefox
   ```
3. Check out this repo and install `ansible-playbook main.yml -K`

## Undocumented tweaks:

Would be nice to include these...

- Remap Capslock to Escape
