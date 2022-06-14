#!/bin/bash
project_id="$(terraform output -raw project_id)-gke"
region=$(terraform output -raw region)
export KUBECONFIG=kubeconfig
gcloud container clusters get-credentials $project_id --region $region
kubectl get nodes -o wide
