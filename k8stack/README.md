# Kubernetes on Openstack by heat templates

Run a Kubernetes cluster within an openstack tenant by using heat templates.

It's an adaptation of original templates at :

https://github.com/kubernetes/kubernetes/tree/master/cluster/openstack-heat/kubernetes-heat

## How to

First of all , if you don't have the kuberneter-server and kubernetes-salt binaries then you need to save it in any place.
For example, we'll use Swift in our Openstack environment:

```
$ wget -q -O - https://get.k8s.io | bash
....
$ cd kubernetes/server
$ swift post k8s
$ swift upload k8s kubernetes-server-linux-amd64.tar.gz
$ swift upload k8s kubernetes-salt.tar.gz
$ swift post --read-acl ".r:*" -m "Temp-URL-Key:Yz4ya9QemL9o7vnJDwGoUUecgGftGMqm" k8s
$ swift tempurl GET 31536000 /v1/AUTH_7a9e9057554f459e8eee7e52ff1694da/k8s/kubernetes-salt.tar.gz Yz4ya9QemL9o7vnJDwGoUUecgGftGMqm
$ swift tempurl GET 31536000 /v1/AUTH_7a9e9057554f459e8eee7e52ff1694da/k8s/kubernetes-server-linux-amd64.tar.gz Yz4ya9QemL9o7vnJDwGoUUecgGftGMqm
```

Resources are available at the following URLs:

- https://\<swift-url\>/v1/AUTH_7a9e9057554f459e8eee7e52ff1694da/k8s/kubernetes-salt.tar.gz?temp_url_sig=\<temp_url_sig\>&temp_url_expires=\<temp_url_expires\>
- https://\<swift-url\>/v1/AUTH_7a9e9057554f459e8eee7e52ff1694da/k8s/kubernetes-server-linux-amd64.tar.gz?temp_url_sig=\<temp_url_sig\>&temp_url_expires=\<temp_url_expires\>

Use that URLs at env.yaml file for kubernetes_server_url and kubernetes_salt_url.

Finally create the heat stack by typing :

```
$ heat create-stack -e env.yaml -f kubecluster.yaml k8stack
```
