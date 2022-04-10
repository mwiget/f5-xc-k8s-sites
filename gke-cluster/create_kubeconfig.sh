#!/bin/bash
project_id="$(terraform output -raw project_id)-gke"
region=$(terraform output -raw region)
gcloud container clusters get-credentials $project_id --region $region
cp ~/.kube/config kubeconfig
kubectl get nodes -o wide
