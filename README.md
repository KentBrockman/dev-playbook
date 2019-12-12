# Development Box Ansible Playbook

An ansible playbook to set up my development machine exactly how I like it!

Currently targeting and tested against [Pop!\_OS 19.10](https://system76.com/pop).

## Installation

1. Checkout this repository
   ```
   git clone https://github.com/KentBrockman/dev-playbook.git
   cd dev-playbook
   ```
2. Install Ansible. Confirm version >=2.8
   ```
   sudo apt install ansible
   ansible-playbook --version
   ```
3. Install modules:
   ```
   ansible-galaxy install basvandenbrink.firefox
   ```
4. Run the playbook like so:
   ```
   ansible-playbook main.yml -K
   ```
