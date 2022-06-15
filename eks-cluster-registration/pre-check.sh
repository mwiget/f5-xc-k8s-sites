#!/bin/bash
cd ../eks-cluster
while [ $(kubectl --kubeconfig kubeconfig get pods -n ves-system|grep vp-manager-|grep Running|wc -l) -ne 3 ] ; do
  echo "waiting for eks-cluster ($SECONDS secs) ..."
  sleep 1
done
echo "eks-cluster ready"
