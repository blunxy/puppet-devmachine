#!/bin/bash
sudo puppet apply --modulepath=/etc/puppet/modules -e "include $*"
