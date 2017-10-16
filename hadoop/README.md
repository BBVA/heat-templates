# Hadoop by Heat templates

The goal of these templates is provide a virtual infrastructure to deploy a hadoop cluster.

To create nested resources just type this command:

```ssh
$heat stack-create -e env_vars.yaml -f hadoop-cluster.yaml hadoop
```
