#!/bin/bash
CLUSTER_NAME=$(oc status|grep https://api|cut -d/ -f3|cut -d. -f2)
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
sed -i "s/volterra\.io$/volterra.us/" ce_k8s.yml
sed -i "s/\.ves\./.staging./" ce_k8s.yml
sed -i "s/replicas: 1/replicas: 3/" ce_k8s.yml

#linenr=$(grep -in 'SITE ACCESS VIA NODEPORT' ce_k8s.yml | cut -d: -f1)
#linenr=$(($linenr+1))
#echo "enablind NodePort (uncomment line $linenr onwards) ..."
#sed -i "$linenr,\$s/^#//" ce_k8s.yml

kubectl --kubeconfig $CLUSTER_NAME/auth/kubeconfig apply -f ce_k8s.yml
#kubectl --kubeconfig kubeconfig apply -f lb.yml
