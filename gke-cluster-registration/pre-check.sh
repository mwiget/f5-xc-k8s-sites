#!/bin/bash
cd ../gke-cluster
while [ $(kubectl --kubeconfig kubeconfig get pods -n ves-system|grep vp-manager-|wc -l) -ne 3 ] ; do
  echo "waiting for gke-cluster ($SECONDS secs) ..."
  sleep 1
done
echo "gke-cluster ready"
