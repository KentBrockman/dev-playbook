#!/bin/bash

pushd {{ dev_playbook_directory }}
git up
echo 'Running dev-playbook! Command is: ansible-playbook -K main.yml'
echo 'You will be prompted for your password. Press CTRL-C to abort'
ansible-playbook -K main.yml
popd
