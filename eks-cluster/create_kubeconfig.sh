#!/bin/bash
export KUBECONFIG=kubeconfig
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
kubectl get nodes -o wide
