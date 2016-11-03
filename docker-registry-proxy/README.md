# Docker Registry and Proxy

Within this stack template we could deploy a docker host as docker registry and proxy at once.

![alt text](assets/docker_registry_proxy.png "Docker registry and proxy")

In the docker host we'll have three services running : 

* docker-redis : Default proxy cache storage. This service runs a local docker container within Redis
* docker-registry : The docker registry, 
* docker-registry-proxy

## Creating the stack

To create a stack from this template, we should know the defaults and optional values.

By default the needed parameters are (see descriptions of them [in file](heat_registry_docker-yaml) ): 

  - hostname
  - domain
  - server_key
  - server_flavor
  - server_image: At the moment we are basing on CoreOS.
  - fip_network: Floating IPs network.
  - os_username
  - os_password
  - os_region
  - os_authurl

Let's create a stack by typing params in commnad line :

```
$ heat stack-create -f heat_registry_proxy -P hostname=myhost -P domain=mydomain.com -P server_key=mykey
-P server_flavor=m1.small -P server_image=CoreOS -P fip_network="pool-1" -P os_username=engapa
-P os_password=xxxxx -P os_region=Spain_Mad -P os_authurl=https://identity:5000/v2 docker_registry
```

We prefer to use environment files to specify params, in this case the command would be like this:

```
$ heat stack-create -e my_env.yml -f heat_registry_proxy.yml
```

Where the contents of env file is :

```

```

## Configure docker registry clients:

TODO

## Requirements

You need a openstack swift account , in other case feel free to change the config file to change the storage backend

## TODO

Use Designate resource of heat to add a record with <hostname>.<domain>