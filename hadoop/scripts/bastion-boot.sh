#!/bin/bash

# Exit on first command failure or undefined var reference
set -ex

function notify() {
    %wc_notify% --data-binary \
               "{\"status\": \"$1\", \"reason\": \"$2\", \"data\": \"$2\"}"
}

{
  yum install epel-release git ansible -y &&

  git clone -b %hadoop_ansible_git_rev% %hadoop_ansible_git_url% &&

  cd /tmp/inventory-playbook &&

  ansible-playbook -i localhost, -c local inventory.yaml

} || notify "ERROR" "An unexpected error was thrown" && exit 1


notify "SUCCESS" "Ready to configure the Hadoop Cluster" && exit 0