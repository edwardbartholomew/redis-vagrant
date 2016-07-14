# redis-vagrant

## Overview

This github repo uses Vagrant with Chef and VirtualBox to create and provision a 3-node redis cluster with sentinel running to promote a new master in the event of a failure.
Information regarding the chef cookbook may be found inside the cookbook's README.

Also included is a python script to query http://checkip.dyndns.org, and append the output to a file in /tmp. Due to the location in the host directory, it will be automatically be available on the virtual servers in the /vagrant directory of each virtual machine.

## Prereqs
Vagrant 1.8.4 was used to provision this cluster.
Vagrant plugins installed on my machine, not all required but documented below:
berkshelf (4.3.5)
omnibus (5.4.0)
vagrant-berkshelf (4.1.0)
vagrant-omnibus (1.4.1)
vagrant-share (1.1.5, system)
vagrant-vbguest (0.12.0)

## There is a simple test script (test.sh) with hardcoded IPs and Ports to check the roles of each node in the cluster, simulate a failure, and re-check the roles to verify one of the slave nodes has been promoted to master.
