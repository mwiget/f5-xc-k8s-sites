#!/bin/bash
CLUSTER_NAME=$(oc status|grep https://api|cut -d/ -f3|cut -d. -f2)
if [ ${#CLUSTER_NAME} -gt 40 ]; then
  echo "no cluster found"
  exit 1
fi
export KUBECONFIG=$CLUSTER_NAME/auth/kubeconfig
