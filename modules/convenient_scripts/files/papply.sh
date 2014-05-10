#!/bin/bash
sudo puppet apply --modulepath=/etc/puppet/modules /etc/puppet/manifests $*
