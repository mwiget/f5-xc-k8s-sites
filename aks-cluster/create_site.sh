#!/bin/bash
CLUSTER_NAME=$(terraform output -raw kubernetes_cluster_name)
if [ ${#CLUSTER_NAME} -gt 40 ]; then
  echo "no cluster found"
  exit 1
fi
SITE_TOKEN=$(terraform output -raw f5xc_site_token)
curl -o ce_k8s.yml  https://gitlab.com/volterra.io/volterra-ce/-/raw/master/k8s/ce_k8s.yml
sed -i "s/<cluster name>/$CLUSTER_NAME/" ce_k8s.yml
sed -i "s/<latitude>/50.0/" ce_k8s.yml
sed -i "s/<longitude>/12.0/" ce_k8s.yml
sed -i "s/<token>/$SITE_TOKEN/" ce_k8s.yml
sed -i "s/\.io$/.us/" ce_k8s.yml
sed -i "s/\.ves\./.staging./" ce_k8s.yml
./create_kubeconfig.sh
kubectl apply -f ce_k8s.yml
