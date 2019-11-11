# k8s setup cluster with ansible

It's quickly a stand alone installation of k8s server-cluster (**ubuntu servers**)

#### Requirements
**ansible** version **2.8.1**

#### sandbox
**scaleway** servers building by **terraform**
servers: **Ubuntu Bionic**

#### how-to
there are three roles in the same name folder:

```
├── k8s-setup
│   ├── meta
│   └── tasks
│       └── main.yml
├── k8s-setup-manager
│   └── tasks
│       └── main.yml
└── k8s-setup-worker
    ├── files
    │   └── token.sh
    └── tasks
        └── main.yml
````

For a fresh install you have to add IP servers in hosts with group:
```
[k8s-manager-node]
212.47.226.XX

[k8s-worker-node]
51.158.105.XX
51.15.240.XX
51.158.71.XX
```
The setup will be completed from kube-setup on all-nodes to cluster setup by the join token <=(it will be automaticly generated by the playbook with k8s-setup-worker and will be pushed with k8s-setup-worker by the **token.sh** in files folder)

#### By tags 

You can play part of playbook in case if you want to add new worker-nodes in the cluster. there are tags in playbook

to setup with tag:

````
 ansible-playbook --user=root --tag "k8s-setup" -i  hosts/hosts k8s-setup.yml
 ````

In the feature I will added a non-root user to setup cluster