#!/bin/bash
for folder in *-cluster/; do
  echo $folder ...
  cd $folder
  export KUBECONFIG=kubeconfig
  kubectl get services -n ves-system lb
  cd ..
  echo ""
done
