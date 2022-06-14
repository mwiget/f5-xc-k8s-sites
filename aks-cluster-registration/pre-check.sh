#!/bin/bash
cd ../aks-cluster
while ! kubectl --kubeconfig kubeconfig get pods -n ves-system; do
  echo "waiting for aks-cluster ..."
  sleep 1
done
echo "aks-cluster ready"
