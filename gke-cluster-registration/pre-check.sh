#!/bin/bash
cd ../gke-cluster
while ! kubectl --kubeconfig kubeconfig get pods -n ves-system; do
  echo "waiting for gke-cluster ..."
  sleep 1
done
echo "gke-cluster ready"
