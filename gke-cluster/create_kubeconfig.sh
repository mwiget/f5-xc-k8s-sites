#!/bin/bash
#project_id="$(terraform output -raw project_id)-gke"
cluster=$(terraform output -raw kubernetes_cluster_name)
region=$(terraform output -raw region)
export KUBECONFIG=kubeconfig
gcloud container clusters get-credentials $cluster --region $region
kubectl get nodes -o wide
