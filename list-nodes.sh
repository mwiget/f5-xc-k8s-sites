#!/bin/bash
for folder in *-cluster/; do
  echo $folder ...
  cd $folder
  export KUBECONFIG=kubeconfig
  kubectl get nodes  -o wide
  cd ..
  echo ""
done
