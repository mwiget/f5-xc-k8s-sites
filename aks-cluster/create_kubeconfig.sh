#!/bin/bash
az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)
cp ~/.kube/config kubeconfig
kubectl get nodes -o wide
