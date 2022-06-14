#!/bin/bash
cd ../aks-cluster
while [ $(kubectl --kubeconfig kubeconfig get pods -n ves-system|grep vp-manager-|wc -l) -ne 3 ] ; do
  echo "waiting for aks-cluster ..."
  sleep 1
done
echo "aks-cluster ready"
