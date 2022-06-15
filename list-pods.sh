#!/bin/bash
for folder in *-cluster/; do
  echo $folder ...
  cd $folder
  export KUBECONFIG=kubeconfig
  kubectl get pods -n ves-system -o wide
  cd ..
  echo ""
done
