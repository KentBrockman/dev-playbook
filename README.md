# Development Box Ansible Playbook

An ansible playbook to set up my development machine exactly how I like it!

Currently targeting and tested against [Pop!\_OS 20.04](https://system76.com/pop).

## Installation

### 1. Checkout this repository
```
git clone https://github.com/KentBrockman/dev-playbook.git
cd dev-playbook
```
### 2. Install Ansible. Confirm version >=2.8
```
sudo apt install ansible
ansible-playbook --version
```
### 3. Install roles:
```
ansible-galaxy install -r requirements.yml
```

### 4. Set up host configurations for your boxes

`host_vars `should contain machine specific configurations in a directory that matches the hostname of your machine (e.g. a laptop should have battery management tools, a desktop does not need those)

`group_vars/dev_boxes/vars.yml` contain shared configurations you wish to
apply across all of your hosts.

On first setup, you may have to change the `host_vars` directory name or set up your machines hostname ahead of time.
Make sure your host names match what is in [inventory](./inventory) and are accessible by SSH.
The slicker way to do this is to set up an [ssh config](https://linuxize.com/post/using-the-ssh-config-file/) as aliases to `host_var` directory names.

#### Forget SSH, use localhost

Alternatively, use the `localhost` connection adapter if you wish to run against only your local machine by targetting localhost with `ansible-playbook -l localhost` and not worry about SSH access at all.

### 5. Run the playbook

Typically you should run with `sudo` permission:
```
ansible-playbook main.yml -l dev_boxes -K
```

If running against localhost, you will have to specify variables manually
```
ansible-playbook main.yml -l localhost --extra-vars @group_vars/dev_boxes/vars.yml --extra-vars @host_vars/<YOUR HOST NAME>/vars.yml
```

## After Installing

Some things are not or should not be automated like logging into accounts.
Here is a list of things to do once everything is installed:

1. Reboot. After an install not all changes take effect immediately. It is good to reboot before assuming something isn't working.
2. Log into any cloud service accounts (Google, Microsoft, etc)
3. Log into any applications you've installed (Firefox, Spotify, chat clients, etc)
4. If using [Visual Studio Code Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync), open VSCode and sync your settings
