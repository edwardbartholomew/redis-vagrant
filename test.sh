#!/bin/bash

roles_check() {
  echo -n "Querying original master to find role: "
  redis-cli -h 10.3.3.3 -p 6379 info|grep role
  echo -n "Querying original slave1 to find role: "
  redis-cli -h 10.3.3.4 -p 6379 info|grep role
  echo -n "Querying original slave2 to find role: "
  redis-cli -h 10.3.3.5 -p 6379 info|grep role
}

master_check() {
  echo "Querying sentinel 1 (on original master) to see who is master"
  redis-cli -h 10.3.3.3 -p 16379 sentinel get-master-addr-by-name redis-cluster
  echo "Querying sentinel 2 (on original slave1) to see who is master"
  redis-cli -h 10.3.3.4 -p 16379 sentinel get-master-addr-by-name redis-cluster
  echo "Querying sentinel 3 (on original slave2) to see who is master"
  redis-cli -h 10.3.3.5 -p 16379 sentinel get-master-addr-by-name redis-cluster
}

roles_check
master_check

echo "Crashing original master"
redis-cli -h 10.3.3.3 -p 6379 debug segfault

echo "Sleeping to check roles and find the new master"
sleep 35
roles_check
master_check

