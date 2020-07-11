# Development Box Ansible Playbook

An ansible playbook to set up my development machine exactly how I like it!

Currently targeting and tested against [Pop!\_OS 20.04](https://system76.com/pop).

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
3. Install roles:
   ```
   ansible-galaxy install -r requirements.yml
   ```
4. Run the playbook with sudo permission:
   ```
   ansible-playbook main.yml -K
   ```

## After Installing

Some things are not or should not be automated like logging into accounts.
Here is a list of things to do once everything is installed:

1. Reboot. After an install not all changes take effect immediately. It is good to reboot before assuming something isn't working.
2. Log into any cloud service accounts (Google, Microsoft, etc)
3. Log into any applications you've installed (Firefox, Spotify, chat clients, etc)
4. If using [Visual Studio Code Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync), open VSCode and sync your settings
