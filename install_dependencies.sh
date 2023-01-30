#!/bin/sh

ansible-galaxy install -r requirements.yml --force
ansible-galaxy collection install -r requirements.yml --force
