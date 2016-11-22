# OpenShift docker container

Run OpenShift on a docker container.

It's required a CentOS or RedHat vm as docker host.

Create a stack by typing following command:

```
heat stack-create -e env.yml -f heat_docker_oenshift.yml oshift
```