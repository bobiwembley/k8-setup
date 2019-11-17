#!/bin/bash

touch inventory/hosts

echo [k8s-manager-node] > inventory/hosts
echo [k8s-worker-node] >> inventory/hosts

###Add manager node to hosts inventory
IPMANAGER="$(scw ps| grep manager | awk '{ print $7  $8 }'  | sed -e 's/K8s-.*/ /g')"
IPWORKER="$(scw ps| grep worker | awk '{ print $7  $8 }'  | sed -e 's/K8s-.*/ /g')"

sed  '/[k8s-manager-node]/a testing testing'  inventory/hosts