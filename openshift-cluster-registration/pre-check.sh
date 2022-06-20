#!/bin/bash
cd ../openshift-cluster
CLUSTER_NAME=$(oc status|grep https://api|cut -d/ -f3|cut -d. -f2)
while [ $(kubectl --kubeconfig $CLUSTER_NAME/auth/kubeconfig get pods -n ves-system|grep vp-manager-|grep Running|wc -l) -ne 3 ] ; do
  echo "waiting for openshift-cluster ($SECONDS secs) ..."
  sleep 1
done
echo "openshift-cluster ready"
