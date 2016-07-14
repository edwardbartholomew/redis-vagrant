redis-cluster Cookbook
===============================
This cookbook will install and configure redis-server and redis-sentinel. This is quick proof of concept for testing. redisio cookbook is much better choice for a redis cookbook.

Requirements
------------
This cookbook is written for OpsWorks (Chef 12 flavor) as uses 

Usage
-----
#### redis-cluster::default
Installs redis-server and redis-sentinel on the node as services.

Attributes
----------
#### default['redis-cluster']['slave'] 
True if this node is a slave - will use slaveof directive in the redis.conf
#### default['redis-cluster']['master-ip']
This should be IP address of the initial redis master node and is used to populate both redis.conf and sentinel.conf

License and Authors
-------------------
Authors: Ed Bartholomew
